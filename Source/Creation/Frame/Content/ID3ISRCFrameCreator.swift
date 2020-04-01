//
//  ID3ISRCFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/30/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3ISRCFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let keyFrame = id3Tag.frames[.InitialKey] as? ID3FrameWithIntegerContent,
            let key = keyFrame.value {
            return createFrameUsing(frameType: .InitialKey, content: String(key), id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
