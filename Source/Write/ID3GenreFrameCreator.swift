//
//  ID3GenreFrameCreator.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3GenreFrameCreator: ID3FrameCreator {
    private let frameCreator: FrameFromStringContentCreator

    init(frameCreator: FrameFromStringContentCreator) {
        self.frameCreator = frameCreator
    }

    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let genreFrame = id3Tag.frames[.genre] as? ID3FrameGenre {
           return frameCreator.createFrame(
                    frameType: .genre,
                    version: id3Tag.properties.version,
                    content: adapt(genre: genreFrame)
            )
        }
        return []
    }

    private func adapt(genre: ID3FrameGenre) -> String {
        var genreString = ""
        if let genreIdentifier = genre.identifier {
            genreString = "(\(genreIdentifier.rawValue))"
        }
        genreString += "\(genre.description ?? "")"
        return genreString
    }
}
