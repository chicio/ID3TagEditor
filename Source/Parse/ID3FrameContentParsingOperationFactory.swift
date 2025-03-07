//
//  ID3FrameContentParsingOperationFactory.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

// swiftlint:disable line_length

import Foundation

class ID3FrameContentParsingOperationFactory {
    static func make() -> [FrameType: FrameContentParsingOperation] {
        return [
            .artist: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .artist),
            .albumArtist: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .albumArtist),
            .album: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .album),
            .composer: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .composer),
            .conductor: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .conductor),
            .contentGrouping: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .contentGrouping),
            .copyright: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .copyright),
            .discPosition: ID3DiscPositionFrameContentParsingOperationFactory.make(),
            .initialKey: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .initialKey),
            .encodedBy: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .encodedBy),
            .encoderSettings: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .encoderSettings),
            .fileOwner: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .fileOwner),
            .lyricist: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .lyricist),
            .mixArtist: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .mixArtist),
            .iTunesPodcastCategory: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .iTunesPodcastCategory),
            .iTunesPodcastDescription: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .iTunesPodcastDescription),
            .iTunesPodcastID: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .iTunesPodcastID),
            .iTunesPodcastKeywords: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .iTunesPodcastKeywords),
            .publisher: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .publisher),
            .subtitle: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .subtitle),
            .title: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .title),
            .attachedPicture: ID3AttachedPictureFrameContentParsingOperationFactory.make(),
            .recordingDayMonth: ID3RecordingDayMonthFrameContentParsingOperationFactory.make(),
            .recordingYear: ID3ParsingOperationForID3FrameWithIntegerFactory.make(frameName: .recordingYear),
            .recordingHourMinute: ID3RecordingHourMinuteFrameContentParsingOperationFactory.make(),
            .recordingDateTime: ID3RecordingTimeFrameContentParsingOperationFactory.make(),
            .genre: ID3GenreFrameContentParsingOperationFactory.make(),
            .trackPosition: ID3TrackPositionFrameContentParsingOperationFactory.make(),
            .beatsPerMinute: ID3ParsingOperationForID3FrameWithIntegerFactory.make(frameName: .beatsPerMinute),
            .originalFilename: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .originalFilename),
            .lengthInMilliseconds: ID3ParsingOperationForID3FrameWithIntegerFactory.make(frameName: .lengthInMilliseconds),
            .sizeInBytes: ID3ParsingOperationForID3FrameWithIntegerFactory.make(frameName: .sizeInBytes),
            .unsyncronisedLyrics: ID3LocalizedFrameContentParsingOperationFactory.make(frameName: FrameName.unsynchronizedLyrics),
            .comment: ID3LocalizedFrameContentParsingOperationFactory.make(frameName: FrameName.comment),
            .iTunesGrouping: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .iTunesGrouping),
            .iTunesMovementIndex: ID3ParsingOperationForID3FrameWithIntegerFactory.make(frameName: .iTunesMovementIndex),
            .iTunesMovementCount: ID3ParsingOperationForID3FrameWithIntegerFactory.make(frameName: .iTunesMovementCount),
            .iTunesMovementName: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .iTunesMovementName)
        ]
    }
}

// swiftlint:enable line_length
