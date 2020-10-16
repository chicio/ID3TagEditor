//
//  ID3FrameHeaderCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 14/10/20.
//  2020 Fabrizio Duroni.
//

import Foundation

class ID3FrameHeaderCreator: FrameHeaderCreator {
    private let id3FrameConfiguration: ID3FrameConfiguration
    private let frameContentSizeCalculator: FrameContentSizeCalculator
    private let frameFlagsCreator: FrameFlagsCreator

    init(id3FrameConfiguration: ID3FrameConfiguration,
         frameContentSizeCalculator: FrameContentSizeCalculator,
         frameFlagsCreator: FrameFlagsCreator
    ) {
        self.id3FrameConfiguration = id3FrameConfiguration
        self.frameContentSizeCalculator = frameContentSizeCalculator
        self.frameFlagsCreator = frameFlagsCreator
    }

    func createUsing(version: ID3Version, frameType: FrameType, frameBody: [UInt8]) -> [UInt8] {
        var frameHeader: [UInt8] = id3FrameConfiguration.identifierFor(
                frameType: frameType,
                version: version
        )
        frameHeader.append(contentsOf: frameContentSizeCalculator.calculateSizeOf(
                content: frameBody,
                version: version
        ))
        frameHeader.append(contentsOf: frameFlagsCreator.createFor(version: version))
        return frameHeader
    }
}
