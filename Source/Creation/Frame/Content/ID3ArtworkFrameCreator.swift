//
//  ID3ArtworkFrameCreator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3ArtworkFrameCreator: ID3FrameCreatorsChain {
    private var id3FrameConfiguration: ID3FrameConfiguration
    private let frameContentSizeCalculator: FrameContentSizeCalculator
    private let frameFlagsCreator: FrameFlagsCreator
    private let frameImageTypeHeader: [ID3Version : [String : [UInt8]]] = [
        .version2: [
            "png" : [0x00, 0x50, 0x4E, 0x47, 0x03, 0x00],
            "jpeg" : [0x00, 0x4A, 0x50, 0x47, 0x03, 0x00]
        ],
        .version3: [
            "png" : [0x00, 0x69, 0x6D, 0x61, 0x67, 0x65, 0x2F, 0x70, 0x6E, 0x67, 0x00, 0x03, 0x00],
            "jpeg" : [0x00, 0x69, 0x6D, 0x61, 0x67, 0x65, 0x2F, 0x6A, 0x70, 0x65, 0x67, 0x00, 0x03, 0x00]
        ]
    ]

    init(id3FrameConfiguration: ID3FrameConfiguration,
         frameContentSizeCalculator: FrameContentSizeCalculator,
         frameFlagsCreator: FrameFlagsCreator) {
        self.id3FrameConfiguration = id3FrameConfiguration
        self.frameContentSizeCalculator = frameContentSizeCalculator
        self.frameFlagsCreator = frameFlagsCreator
    }

    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let art = id3Tag.artwork.art {
            var frame: [UInt8] = id3FrameConfiguration.identifierFor(name: "artwork", version: id3Tag.version)
            var contentAsBytes: [UInt8] = [UInt8]()
            contentAsBytes.append(contentsOf: getImageTypeAndCoverTypeUsing(id3Tag: id3Tag))
            contentAsBytes.append(contentsOf: [UInt8](art));
            frame.append(contentsOf: frameContentSizeCalculator.calculateSizeOf(content: contentAsBytes, version: id3Tag.version))
            frame.append(contentsOf: frameFlagsCreator.createFor(version: id3Tag.version))
            frame.append(contentsOf: contentAsBytes)
            return tag + frame
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }

    private func getImageTypeAndCoverTypeUsing(id3Tag: ID3Tag) -> [UInt8] {
        if id3Tag.artwork.isPNG! {
            return frameImageTypeHeader[id3Tag.version]!["png"]!
        }
        return frameImageTypeHeader[id3Tag.version]!["jpeg"]!
    }
}
