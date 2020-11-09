//
//  ID3FrameWithStringContentCreator.swift
//
//  Created by Fabrizio Duroni on 09.11.20.
//  2020 Fabrizio Duroni.
//

import Foundation

class ID3FrameWithStringContentCreator: ID3FrameCreator {
    private let frameCreator: FrameFromStringContentCreator
    private let frameName: FrameName
    private let frameType: FrameType

    init(frameCreator: FrameFromStringContentCreator, frameName: FrameName, frameType: FrameType) {
        self.frameCreator = frameCreator
        self.frameName = frameName
        self.frameType = frameType
    }

    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let frame = id3Tag.frames[frameName] as? ID3FrameWithStringContent {
            return frameCreator.createFrame(
                frameType: frameType,
                version: id3Tag.properties.version,
                content: frame.content
            )
        }
        return []
    }
}
