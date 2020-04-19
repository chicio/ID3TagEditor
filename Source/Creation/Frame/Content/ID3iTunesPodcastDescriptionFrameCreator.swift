//
//  ID3iTunesPodcastDescriptionFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3iTunesPodcastDescriptionFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let podcastDescriptionFrame = id3Tag.frames[.iTunesPodcastDescription] as? ID3FrameWithStringContent {
            return createFrameUsing(frameType: .iTunesPodcastDescription, content: podcastDescriptionFrame.content, id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
