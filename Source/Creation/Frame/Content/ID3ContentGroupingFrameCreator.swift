//
//  ID3ContentGroupFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3ContentGroupFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let ContentGroupFrame = id3Tag.frames[.ContentGroup] as? ID3FrameWithStringContent {
            return createFrameUsing(frameType: .ContentGroup, content: ContentGroupFrame.content, id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
