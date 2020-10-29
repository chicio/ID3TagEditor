//
//  ID3ArtistFrameCreator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3ArtistFrameCreator: ID3StringFrameCreator, ID3FrameCreator {
    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let artistFrame = id3Tag.frames[.artist] as? ID3FrameWithStringContent {
            return createFrameUsing(frameType: .artist, content: artistFrame.content, id3Tag: id3Tag)
        }
        return []
    }
}
