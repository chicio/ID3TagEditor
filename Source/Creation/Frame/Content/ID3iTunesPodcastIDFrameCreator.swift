//
//  ID3iTunesPodcastIDFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3iTunesPodcastIDFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let podcastIDFrame = id3Tag.frames[.iTunesPodcastID] as? ID3FrameWithStringContent {
            return createFrameUsing(
                frameType: .iTunesPodcastID,
                content: podcastIDFrame.content,
                id3Tag: id3Tag,
                andAddItTo: tag
            )
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
