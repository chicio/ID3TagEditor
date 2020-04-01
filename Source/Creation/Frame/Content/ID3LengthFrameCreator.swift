//
//  ID3LengthFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/30/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3LengthFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let lengthFrame = id3Tag.frames[.Length] as? ID3FrameWithIntegerContent,
            let length = lengthFrame.value {
            return createFrameUsing(frameType: .Length, content: String(length), id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
