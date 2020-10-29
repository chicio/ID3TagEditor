//
//  ID3iTunesMovementIndexFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3iTunesMovementIndexFrameCreator: ID3StringFrameCreator, ID3FrameCreator {
    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let indexFrame = id3Tag.frames[.iTunesMovementIndex] as? ID3FrameWithIntegerContent,
            let index = indexFrame.value {
            return createFrameUsing(
                frameType: .iTunesMovementIndex,
                content: String(index),
                id3Tag: id3Tag)
        }
        return []
    }
}
