//
//  ID3iTunesPodcastCategoryFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3iTunesPodcastCategoryFrameCreator: ID3StringFrameCreator, ID3FrameCreator {
    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let podcastCategoryFrame = id3Tag.frames[.iTunesPodcastCategory] as? ID3FrameWithStringContent {
            return createFrameUsing(
                frameType: .iTunesPodcastCategory,
                content: podcastCategoryFrame.content,
                id3Tag: id3Tag)
        }
        return []
    }
}
