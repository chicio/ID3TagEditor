//
//  ID3GenreFrameCreator.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3GenreFrameCreator: ID3FrameCreatorsChain {
    private let frameCreator: FrameFromStringContentCreator
    private var id3FrameConfiguration: ID3FrameConfiguration

    init(frameCreator: FrameFromStringContentCreator, id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameCreator = frameCreator
        self.id3FrameConfiguration = id3FrameConfiguration
    }

    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let genre = id3Tag.genre {
            let newTag = tag +
                    frameCreator.createFrame(
                            frameIdentifier: id3FrameConfiguration.identifierFor(frameType: .Genre, version: id3Tag.version),
                            version: id3Tag.version,
                            content: adapt(genre: genre)
                    )
            return super.createFrames(id3Tag: id3Tag, tag: newTag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }

    private func adapt(genre: Genre) -> String {
        var genreString = ""
        if let genreIdentifier = genre.identifier {
            genreString = "(\(genreIdentifier.rawValue))"
        }
        genreString = genreString + "\(genre.description ?? "")"
        return genreString
    }
}
