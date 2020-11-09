//
//  ID3AlbumArtistFrameCreator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameWithStringContentCreator: ID3FrameCreator {
    private let frameCreator: FrameFromStringContentCreator
    private let id3FrameConfiguration: ID3FrameConfiguration

    init(frameCreator: FrameFromStringContentCreator, id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameCreator = frameCreator
        self.id3FrameConfiguration = id3FrameConfiguration
    }

    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let albumArtistFrame = id3Tag.frames[.albumArtist] as? ID3FrameWithStringContent {
            return frameCreator.createFrame(
                frameType: FrameType.albumArtist,
                version: id3Tag.properties.version,
                content: albumArtistFrame.content
            )
        }
        return []
    }
}
