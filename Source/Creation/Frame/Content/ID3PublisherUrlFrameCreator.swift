//
//  ID3PublisherUrlFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/30/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3PublisherUrlFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let publisherUrlFrame = id3Tag.frames[.PublisherUrl] as? ID3FrameWithStringContent {
            return createFrameUsing(frameType: .PublisherUrl, content: publisherUrlFrame.content, id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
