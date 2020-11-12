//
//  FrameFromIntegerContentAdapter.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 12.11.20.
//  2020 Fabrizio Duroni.
//

import Foundation

class FrameFromIntegerContentAdapter: FrameContentAdapter {
    private let frameCreator: FrameFromStringContentCreator

    init(frameCreator: FrameFromStringContentCreator) {
        self.frameCreator = frameCreator
    }

    func createFrames(id3Tag: ID3Tag, frameName: FrameName, frameType: FrameType) -> [UInt8] {
        if let frame = id3Tag.frames[frameName] as? ID3FrameWithIntegerContent,
            let value = frame.value {
            return frameCreator.createFrame(
                frameType: frameType,
                version: id3Tag.properties.version,
                content: String(value)
            )
        }
        return []
    }
}
