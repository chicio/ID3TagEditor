//
//  ID3AlbumArtistFrameCreator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3AlbumArtistFrameCreator: ID3StringFrameCreator, ID3FrameCreator {
    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let albumArtistFrame = id3Tag.frames[.albumArtist] as? ID3FrameWithStringContent {
            return createFrameUsing(
                frameType: .albumArtist,
                content: albumArtistFrame.content,
                id3Tag: id3Tag
            )
        }
        return []
    }
}
