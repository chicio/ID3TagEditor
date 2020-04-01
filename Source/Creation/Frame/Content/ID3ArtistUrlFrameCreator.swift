//
//  ID3ArtistUrlFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/30/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3ArtistUrlFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let artistUrlFrame = id3Tag.frames[.ArtistUrl] as? ID3FrameWithStringContent {
            return createFrameUsing(frameType: .ArtistUrl, content: artistUrlFrame.content, id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
