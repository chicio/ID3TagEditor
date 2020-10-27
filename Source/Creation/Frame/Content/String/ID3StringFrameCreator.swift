//
//  ID3StringFrameCreator.swift
//
//  Created by Fabrizio Duroni on 12/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3StringFrameCreator: ID3FrameCreatorsChain {
    let frameCreator: FrameFromStringContentCreator
    let id3FrameConfiguration: ID3FrameConfiguration

    init(frameCreator: FrameFromStringContentCreator, id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameCreator = frameCreator
        self.id3FrameConfiguration = id3FrameConfiguration
    }

    func createFrameUsing(frameType: FrameType, content: String, id3Tag: ID3Tag, andAddItTo tag: [UInt8]) -> [UInt8] {
        let newTag = tag +
                frameCreator.createFrame(
                        frameType: frameType,
                        version: id3Tag.properties.version,
                        content: content
                )
        return super.createFrames(id3Tag: id3Tag, tag: newTag)
    }
}
