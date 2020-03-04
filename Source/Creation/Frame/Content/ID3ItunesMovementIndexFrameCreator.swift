//
//  ID3ItunesMovementIndexFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3ItunesMovementIndexFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let indexFrame = id3Tag.frames[.ITunesMovementIndex] as? ID3FrameWithIntegerContent,
            let index = indexFrame.value {
            return createFrameUsing(frameType: .ITunesMovementIndex, content: String(index), id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
