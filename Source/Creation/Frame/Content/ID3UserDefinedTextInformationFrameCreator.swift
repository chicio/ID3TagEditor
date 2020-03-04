//
//  ID3UserDefinedTextInformationFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3UserDefinedTextInformationFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let userTextFrame = id3Tag.frames[.UserDefinedTextInformation] as? ID3FrameWithStringContent {
            return createFrameUsing(frameType: .UserDefinedTextInformation, content: userTextFrame.content, id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
