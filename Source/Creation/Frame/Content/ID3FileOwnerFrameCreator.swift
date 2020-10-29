//
//  ID3FileOwnerFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FileOwnerFrameCreator: ID3StringFrameCreator, ID3FrameCreator {
    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let fileOwnerFrame = id3Tag.frames[.fileOwner] as? ID3FrameWithStringContent {
            return createFrameUsing(
                frameType: .fileOwner,
                content: fileOwnerFrame.content,
                id3Tag: id3Tag)
        }
        return []
    }
}
