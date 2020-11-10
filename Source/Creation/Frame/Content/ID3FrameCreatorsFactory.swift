//
//  ID3FrameCreatorsFactory.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

// swiftlint:disable line_length

import Foundation

class ID3FrameCreatorsFactory {
    static func make() -> [ID3FrameCreator] {
        let frameConfiguration = ID3FrameConfiguration()
        let frameFromStringUTF16ContentCreator = ID3FrameFromStringContentCreatorWithUTF16EncodingFactory.make()
        let frameFromStringISO88591ContentCreator = ID3FrameFromStringContentCreatorWithISO88591EncodingFactory.make()

        return [
            ID3FrameWithStringContentCreator(frameCreator: frameFromStringUTF16ContentCreator, frameName: .album, frameType: .album),
            ID3FrameWithStringContentCreator(frameCreator: frameFromStringUTF16ContentCreator, frameName: .albumArtist, frameType: .albumArtist),
            ID3FrameWithStringContentCreator(frameCreator: frameFromStringUTF16ContentCreator, frameName: .artist, frameType: .artist),
            ID3FrameWithStringContentCreator(frameCreator: frameFromStringUTF16ContentCreator, frameName: .title, frameType: .title),
            ID3GenreFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3TrackPositionFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3AttachedPicturesFramesCreatorFactory.make(),
            ID3FrameWithStringContentCreator(frameCreator: frameFromStringUTF16ContentCreator, frameName: .composer, frameType: .composer),
            ID3FrameWithStringContentCreator(frameCreator: frameFromStringUTF16ContentCreator, frameName: .conductor, frameType: .conductor),
            ID3FrameWithStringContentCreator(frameCreator: frameFromStringUTF16ContentCreator, frameName: .contentGrouping, frameType: .contentGrouping),
            ID3FrameWithStringContentCreator(frameCreator: frameFromStringUTF16ContentCreator, frameName: .copyright, frameType: .copyright),
            ID3FrameWithStringContentCreator(frameCreator: frameFromStringUTF16ContentCreator, frameName: .encodedBy, frameType: .encodedBy),
            ID3FrameWithStringContentCreator(frameCreator: frameFromStringUTF16ContentCreator, frameName: .encoderSettings, frameType: .encoderSettings),
            ID3FileOwnerFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3LyricistFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3MixArtistFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3PublisherFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3SubtitleFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3DiscPositionFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3FramesWithLocalizedContentCreatorFactory.make()
        ]
        + ID3RecordingTimesFrameCreatorsFactory.make()
        + ID3iTunesFrameCreatorsFactory.make()
    }
}
