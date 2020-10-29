//
//  ID3ContentGroupingFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3ContentGroupingFrameCreator: ID3StringFrameCreator, ID3FrameCreator {
    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let contentGroupingFrame = id3Tag.frames[.contentGrouping] as? ID3FrameWithStringContent {
            return createFrameUsing(
                frameType: .contentGrouping,
                content: contentGroupingFrame.content,
                id3Tag: id3Tag
            )
        }
        return []
    }
}
