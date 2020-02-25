//
//  ID3UnsyncedLyricsFrameCreator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3UnsyncedLyricsFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let unsyncedLyricsFrame = id3Tag.frames[.UnsyncedLyrics] as? ID3FrameWithStringContent {
            return createFrameUsing(frameType: .UnsyncedLyrics, content: unsyncedLyricsFrame.content, id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
