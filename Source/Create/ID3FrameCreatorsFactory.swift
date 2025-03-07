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
        let frameFromStringUTF16ContentAdapter = FrameFromStringContentAdapter(frameCreator: frameFromStringUTF16ContentCreator)
        let frameFromIntegerContentAdapter = FrameFromIntegerContentAdapter(frameCreator: frameFromStringISO88591ContentCreator)

        return [
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .album, frameType: .album),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .albumArtist, frameType: .albumArtist),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .artist, frameType: .artist),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .title, frameType: .title),
            ID3GenreFrameCreator(frameCreator: frameFromStringISO88591ContentCreator),
            ID3TrackPositionFrameCreator(frameCreator: frameFromStringISO88591ContentCreator),
            ID3AttachedPicturesFramesCreatorFactory.make(),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .composer, frameType: .composer),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .conductor, frameType: .conductor),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .contentGrouping, frameType: .contentGrouping),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .copyright, frameType: .copyright),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .encodedBy, frameType: .encodedBy),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .encoderSettings, frameType: .encoderSettings),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .fileOwner, frameType: .fileOwner),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .lyricist, frameType: .lyricist),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .mixArtist, frameType: .mixArtist),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .publisher, frameType: .publisher),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .subtitle, frameType: .subtitle),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .initialKey, frameType: .initialKey),
            ID3FrameContentCreator(frameCreator: frameFromIntegerContentAdapter, frameName: .beatsPerMinute, frameType: .beatsPerMinute),
            ID3DiscPositionFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3FrameContentCreator(frameCreator: frameFromStringUTF16ContentAdapter, frameName: .originalFilename, frameType: .originalFilename),
            ID3FrameContentCreator(frameCreator: frameFromIntegerContentAdapter, frameName: .lengthInMilliseconds, frameType: .lengthInMilliseconds),
            ID3FrameContentCreator(frameCreator: frameFromIntegerContentAdapter, frameName: .sizeInBytes, frameType: .sizeInBytes),
            ID3FramesWithLocalizedContentCreatorFactory.make()
        ]
        + ID3RecordingTimesFrameCreatorsFactory.make()
        + ID3iTunesFrameCreatorsFactory.make()
    }
}

// swiftlint:enable line_length
