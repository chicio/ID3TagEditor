//
//  ID3ArtistFrameCreator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3ArtistFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let artistFrame = id3Tag.frames[.Artist] as? ID3FrameWithStringContent {
            return createFrameUsing(frameType: .artist, content: artistFrame.content, id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
