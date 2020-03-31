//
//  ID3UserDefinedUrlFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3UserDefinedUrlFrameCreator: ID3FrameCreatorsChain {
    private let frameCreator: ID3CommentTypesFrameCreator
    private var id3FrameConfiguration: ID3FrameConfiguration
    
    init(frameCreator: ID3CommentTypesFrameCreator, id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameCreator = frameCreator
        self.id3FrameConfiguration = id3FrameConfiguration
    }
    
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let userUrlFrame = id3Tag.frames[.UserDefinedUrl] as? ID3FrameUserDefinedText {
            let newTag = tag +
                frameCreator.createFrame(
                    frameIdentifier: id3FrameConfiguration.identifierFor(
                        frameType: .UserDefinedUrl,
                        version: id3Tag.properties.version
                    ),
                    version: id3Tag.properties.version, language: nil, description: userUrlFrame.description,
                    content: userUrlFrame.content
            )
         return super.createFrames(id3Tag: id3Tag, tag: newTag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
