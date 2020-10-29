//
//  ID3EncodedByFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3EncodedByFrameCreator: ID3StringFrameCreator, ID3FrameCreator {
    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let encodedByFrame = id3Tag.frames[.encodedBy] as? ID3FrameWithStringContent {
            return createFrameUsing(
                frameType: .encodedBy,
                content: encodedByFrame.content,
                id3Tag: id3Tag
            )
        }
        return []
    }
}
