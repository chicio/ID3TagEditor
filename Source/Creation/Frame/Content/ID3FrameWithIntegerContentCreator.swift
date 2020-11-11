//
//  ID3FrameWithIntegerContentCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 11.11.20.
//  Copyright © 2020 Fabrizio Duroni.
//

import Foundation

class ID3FrameWithIntegerContentCreator: ID3FrameCreator {
    private let frameCreator: FrameFromStringContentCreator
    private let frameName: FrameName
    private let frameType: FrameType

    init(frameCreator: FrameFromStringContentCreator, frameName: FrameName, frameType: FrameType) {
        self.frameCreator = frameCreator
        self.frameName = frameName
        self.frameType = frameType
    }

    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let indexFrame = id3Tag.frames[frameName] as? ID3FrameWithIntegerContent,
            let index = indexFrame.value {
            return frameCreator.createFrame(
                frameType: frameType,
                version: id3Tag.properties.version,
                content: String(index)
            )
        }
        return []
    }
}
