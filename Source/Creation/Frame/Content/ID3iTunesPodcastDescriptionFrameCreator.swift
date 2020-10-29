//
//  ID3iTunesPodcastDescriptionFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3iTunesPodcastDescriptionFrameCreator: ID3StringFrameCreator, ID3FrameCreator {
    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let podcastDescriptionFrame = id3Tag.frames[.iTunesPodcastDescription] as? ID3FrameWithStringContent {
            return createFrameUsing(
                frameType: .iTunesPodcastDescription,
                content: podcastDescriptionFrame.content,
                id3Tag: id3Tag
            )
        }
        return []
    }
}
