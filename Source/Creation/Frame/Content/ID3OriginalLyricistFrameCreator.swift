//
//  ID3OriginalLyricistFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/30/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3OriginalLyricistFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let originalLyricistFrame = id3Tag.frames[.OriginalLyricist] as? ID3FrameWithStringContent {
            return createFrameUsing(frameType: .OriginalLyricist, content: originalLyricistFrame.content, id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
