//
//  ID3iTunesMovementCountFrame.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/2/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3iTunesMovementCountFrameCreator: ID3StringFrameCreator, ID3FrameCreator {
    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let countFrame = id3Tag.frames[.iTunesMovementCount] as? ID3FrameWithIntegerContent,
            let count = countFrame.value {
            return createFrameUsing(
                frameType: .iTunesMovementCount,
                content: String(count),
                id3Tag: id3Tag)
        }
        return []
    }
}
