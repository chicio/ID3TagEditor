//
//  ID3iTunesPodcastKeywordsFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3iTunesPodcastKeywordsFrameCreator: ID3StringFrameCreator, ID3FrameCreator {
    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let podcastKeywordsFrame = id3Tag.frames[.iTunesPodcastKeywords] as? ID3FrameWithStringContent {
            return createFrameUsing(
                frameType: .iTunesPodcastKeywords,
                content: podcastKeywordsFrame.content,
                id3Tag: id3Tag
            )
        }
        return []
    }
}
