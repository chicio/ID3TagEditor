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
        let frameFromIntegerContentAdapter = FrameFromIntegerContentAdapter(frameCreator: frameFromStringISO88591ContentCreator)
        let frameFromStringUTF16ContentAdapter = FrameFromStringContentAdapter(frameCreator: frameFromStringUTF16ContentCreator)
        return [
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .iTunesGrouping, frameType: .iTunesGrouping),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .iTunesMovementName, frameType: .iTunesMovementName),
            ID3FrameContentCreator(frameCreator: frameFromIntegerContentAdapter, frameName: .iTunesMovementIndex, frameType: .iTunesMovementIndex),
            ID3FrameContentCreator(frameCreator: frameFromIntegerContentAdapter, frameName: .iTunesMovementCount, frameType: .iTunesMovementCount),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .iTunesPodcastCategory, frameType: .iTunesPodcastCategory),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .iTunesPodcastDescription, frameType: .iTunesPodcastDescription),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .iTunesPodcastID, frameType: .iTunesPodcastID),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .iTunesPodcastKeywords, frameType: .iTunesPodcastKeywords)
        ]
    }
}

// swiftlint:enable line_length
