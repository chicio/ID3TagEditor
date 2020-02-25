//
//  ID3MediaTypeFrameCreator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3MediaTypeFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let mediaTypeFrame = id3Tag.frames[.MediaType] as? ID3FrameWithStringContent {
            return createFrameUsing(frameType: .MediaType, content: mediaTypeFrame.content, id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
