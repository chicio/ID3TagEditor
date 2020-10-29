//
//  ID3AlbumFrameCreator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3AlbumFrameCreator: ID3StringFrameCreator, ID3FrameCreator {
    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let albumFrame = id3Tag.frames[.album] as? ID3FrameWithStringContent {
            return createFrameUsing(frameType: .album, content: albumFrame.content, id3Tag: id3Tag)
        }
        return []
    }
}
