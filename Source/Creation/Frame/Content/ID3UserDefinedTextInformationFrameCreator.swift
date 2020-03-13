//
//  ID3UserDefinedTextInformationFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3UserDefinedTextInformationFrameCreator: ID3FrameCreatorsChain {
    private let frameCreator: UserDefinedTextFrameCreator
    private var id3FrameConfiguration: ID3FrameConfiguration
    
    init(frameCreator: UserDefinedTextFrameCreator, id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameCreator = frameCreator
        self.id3FrameConfiguration = id3FrameConfiguration
    }
    
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let userTextFrame = id3Tag.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText {
            let newTag = tag +
                frameCreator.createFrame(
                    frameIdentifier: id3FrameConfiguration.identifierFor(
                        frameType: .UserDefinedTextInformation,
                        version: id3Tag.properties.version
                    ),
                    version: id3Tag.properties.version, description: userTextFrame.description,
                    content: adapt(content: userTextFrame)
            )
         return super.createFrames(id3Tag: id3Tag, tag: newTag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
    
    private func adapt(content: ID3FrameUserDefinedText) -> String {
        var userTextString = ""
        if let userTextDescription = content.description {
            userTextString = userTextString + "\(userTextDescription)"
        }
        userTextString = userTextString + "\(content.content)"
        return userTextString
    }
}
