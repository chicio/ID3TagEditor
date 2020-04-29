//
//  ID3iTunesPodcastUrlFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/30/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3iTunesPodcastUrlFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let iTunesPodcastUrlFrame = id3Tag.frames[.iTunesPodcastUrl] as? ID3FrameWithStringContent {
            return createFrameUsing(frameType: .iTunesPodcastUrl, content: iTunesPodcastUrlFrame.content, id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
