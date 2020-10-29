//
//  ID3LyricistFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3LyricistFrameCreator: ID3StringFrameCreator, ID3FrameCreator {
    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let lyricistFrame = id3Tag.frames[.lyricist] as? ID3FrameWithStringContent {
            return createFrameUsing(
                frameType: .lyricist,
                content: lyricistFrame.content,
                id3Tag: id3Tag)
        }
        return []
    }
}
