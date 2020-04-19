//
//  ID3iTunesMovementCountFrame.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/2/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3iTunesMovementCountFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let countFrame = id3Tag.frames[.ITunesMovementCount] as? ID3FrameWithIntegerContent,
            let count = countFrame.value {
            return createFrameUsing(frameType: .ITunesMovementCount, content: String(count), id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
