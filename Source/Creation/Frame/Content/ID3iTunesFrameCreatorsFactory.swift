//
//  ID3iTunesFrameCreatorsFactory.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 29.10.20.
//  2020 Fabrizio Duroni.
//

// swiftlint:disable line_length

import Foundation

class ID3iTunesFrameCreatorsFactory {
    static func make() -> [ID3FrameCreator] {
        let frameFromStringISO88591ContentCreator = ID3FrameFromStringContentCreatorWithISO88591EncodingFactory.make()
        let frameFromStringUTF16ContentCreator = ID3FrameFromStringContentCreatorWithUTF16EncodingFactory.make()
        let frameConfiguration = ID3FrameConfiguration()
        return [
            ID3iTunesGroupingFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3iTunesMovementNameFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3iTunesMovementIndexFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3iTunesMovementCountFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3iTunesPodcastCategoryFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3iTunesPodcastDescriptionFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3iTunesPodcastIDFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3iTunesPodcastKeywordsFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration)
        ]
    }
}
