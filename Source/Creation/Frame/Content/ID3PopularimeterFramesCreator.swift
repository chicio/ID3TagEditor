//
//  ID3PopularimeterFramesCreator.swift
//  mplayer
//
//  Created by Alex on 11 Jul 19.
//  Copyright © 2019 Aleksey Lebedev. All rights reserved.
//

import Foundation

class ID3PopularimeterFramesCreator: ID3FrameCreatorsChain {
    private var id3FrameConfiguration: ID3FrameConfiguration
    private let stringToBytesAdapter: StringToBytesAdapter
    private let frameContentSizeCalculator: FrameContentSizeCalculator
    private let frameFlagsCreator: FrameFlagsCreator

    init(stringToBytesAdapter: StringToBytesAdapter,
         id3FrameConfiguration: ID3FrameConfiguration,
         frameContentSizeCalculator: FrameContentSizeCalculator,
         frameFlagsCreator: FrameFlagsCreator) {
        self.stringToBytesAdapter = stringToBytesAdapter
        self.id3FrameConfiguration = id3FrameConfiguration
        self.frameContentSizeCalculator = frameContentSizeCalculator
        self.frameFlagsCreator = frameFlagsCreator
    }

    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {

        var tag = tag

        if let popularimeter = id3Tag.frames[.Popularimeter] as? ID3FramePopularimeter {

            var content: [UInt8] = []
            let emailData = stringToBytesAdapter.adapt(string: popularimeter.email, for: id3Tag.properties.version)
            content.append(contentsOf: emailData)

            content.append(UInt8(popularimeter.rating))

            let counterDataCount = MemoryLayout<UInt32>.size
            let counterData = withUnsafePointer(to: popularimeter.counter.bigEndian) {
                $0.withMemoryRebound(to: UInt8.self, capacity: counterDataCount) {
                    UnsafeBufferPointer(start: $0, count: counterDataCount)
                }
            }
            content.append(contentsOf: counterData)

            tag.append(contentsOf: id3FrameConfiguration.identifierFor(
                frameType: .Popularimeter,
                version: id3Tag.properties.version
            ))
            tag.append(contentsOf: frameContentSizeCalculator.calculateSizeOf(
                content: content,
                version: id3Tag.properties.version
            ))
            tag.append(contentsOf: frameFlagsCreator.createFor(version: id3Tag.properties.version))
            tag.append(contentsOf: content)

        }

        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
