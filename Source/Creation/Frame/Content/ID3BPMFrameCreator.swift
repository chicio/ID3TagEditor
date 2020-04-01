//
//  ID3BPMFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/30/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3BPMFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let bpmFrame = id3Tag.frames[.BPM] as? ID3FrameWithIntegerContent,
            let bpm = bpmFrame.value {
            return createFrameUsing(frameType: .BPM, content: String(bpm), id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
