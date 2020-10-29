//
//  ID3SubtitleFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3SubtitleFrameCreator: ID3StringFrameCreator, ID3FrameCreator {
    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let subtitleFrame = id3Tag.frames[.subtitle] as? ID3FrameWithStringContent {
            return createFrameUsing(
                frameType: .subtitle,
                content: subtitleFrame.content,
                id3Tag: id3Tag)
        }
        return []
    }
}
