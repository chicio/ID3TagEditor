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
            ID3FrameWithStringContentCreator(frameCreator: frameFromStringUTF16ContentCreator, frameName: .iTunesGrouping, frameType: .iTunesGrouping),
            ID3FrameWithStringContentCreator(frameCreator: frameFromStringUTF16ContentCreator, frameName: .iTunesMovementName, frameType: .iTunesMovementName),
            ID3iTunesMovementIndexFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3iTunesMovementCountFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3FrameWithStringContentCreator(frameCreator: frameFromStringUTF16ContentCreator, frameName: .iTunesPodcastCategory, frameType: .iTunesPodcastCategory),
            ID3FrameWithStringContentCreator(frameCreator: frameFromStringUTF16ContentCreator, frameName: .iTunesPodcastDescription, frameType: .iTunesPodcastDescription),
            ID3FrameWithStringContentCreator(frameCreator: frameFromStringUTF16ContentCreator, frameName: .iTunesPodcastID, frameType: .iTunesPodcastID),
            ID3FrameWithStringContentCreator(frameCreator: frameFromStringUTF16ContentCreator, frameName: .iTunesPodcastKeywords, frameType: .iTunesPodcastKeywords)
        ]
    }
}
