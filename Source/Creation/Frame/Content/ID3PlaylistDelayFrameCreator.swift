//
//  ID3PlaylistDelayFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/30/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3PlaylistDelayFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let playlistDelayFrame = id3Tag.frames[.PlaylistDelay] as? ID3FrameWithStringContent {
            return createFrameUsing(frameType: .PlaylistDelay, content: playlistDelayFrame.content, id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
