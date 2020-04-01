//
//  ID3BooleanFrameCreator.swift
//
//  Created by Nolaine Crusher on 03/31/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3BooleanFrameCreator: ID3FrameCreatorsChain {
    let frameCreator: FrameFromBooleanContentCreator
    let id3FrameConfiguration: ID3FrameConfiguration
    
    init(frameCreator: FrameFromBooleanContentCreator, id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameCreator = frameCreator
        self.id3FrameConfiguration = id3FrameConfiguration
    }
    
    func createFrameUsing(frameType: FrameType, value: Bool, id3Tag: ID3Tag, andAddItTo tag: [UInt8]) -> [UInt8] {
        let newTag = tag + frameCreator.createFrame(
            frameIdentifier: id3FrameConfiguration.identifierFor(
                frameType: frameType,
                version: id3Tag.properties.version
            ),
            version: id3Tag.properties.version,
            value: value
        )
        return super.createFrames(id3Tag: id3Tag, tag: newTag)
    }
}
