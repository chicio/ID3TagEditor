//
//  ID3UnsyncronizedLyricsFrameCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 09.10.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3FramesWithLocalizedContentCreator: ID3FrameCreatorsChain {
    private let localizedFrameNames: [FrameType: [FrameName]]
    private let localizedFrameCreator: LocalizedFrameCreator

    init(localizedFrameNames: [FrameType: [FrameName]],
         localizedFrameCreator: LocalizedFrameCreator) {
        self.localizedFrameNames = localizedFrameNames
        self.localizedFrameCreator = localizedFrameCreator
        super.init()
    }

    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        let frames: [UInt8] = localizedFrameNames.reduce([]) { (accumulator, localizedFrameNameElement) in
            return accumulator + generateFramesFor(
                frameType: localizedFrameNameElement.key,
                localizedFrameNames: localizedFrameNameElement.value,
                id3Tag: id3Tag
            )
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag + frames)
    }

    private func generateFramesFor(frameType: FrameType, localizedFrameNames: [FrameName], id3Tag: ID3Tag) -> [UInt8] {
        return localizedFrameNames.reduce([], { accumulator, localizedFrameName in
            if let frame = id3Tag.frames[localizedFrameName] as? ID3FrameWithLocalizedContent {
                return accumulator + localizedFrameCreator.createFrame(
                    using: frame,
                    version: id3Tag.properties.version,
                    frameType: frameType
                )
            }
            return accumulator
        })
    }
}
