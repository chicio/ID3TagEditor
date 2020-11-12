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
            .encodedBy: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .encodedBy),
            .encoderSettings: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .encoderSettings),
            .fileOwner: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .fileOwner),
            .lyricist: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .lyricist),
            .mixArtist: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .mixArtist),
            .iTunesPodcastCategory: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .iTunesPodcastCategory),
            .iTunesPodcastDescription: ID3ParsingOperationForID3FrameWithStringFactory.make(frameName: .iTunesPodcastDescription),
            .iTunesPodcastID: ID3iTunesPodcastIDFrameContentParsingOperationFactory.make(),
            .iTunesPodcastKeywords: ID3iTunesPodcastKeywordsFrameContentParsingOperationFactory.make(),
            .publisher: ID3PublisherFrameContentParsingOperationFactory.make(),
            .subtitle: ID3SubtitleFrameContentParsingOperationFactory.make(),
            .title: ID3TitleFrameContentParsingOperationFactory.make(),
            .attachedPicture: ID3AttachedPictureFrameContentParsingOperationFactory.make(),
            .recordingDayMonth: ID3RecordingDayMonthFrameContentParsingOperationFactory.make(),
            .recordingYear: ID3ParsingOperationForID3FrameWithIntegerFactory.make(frameName: .recordingYear),
            .recordingHourMinute: ID3RecordingHourMinuteFrameContentParsingOperationFactory.make(),
            .recordingDateTime: ID3RecordingTimeFrameContentParsingOperationFactory.make(),
            .genre: ID3GenreFrameContentParsingOperationFactory.make(),
            .trackPosition: ID3TrackPositionFrameContentParsingOperationFactory.make(),
            .unsyncronisedLyrics: ID3LocalizedFrameContentParsingOperationFactory.make(
                frameName: FrameName.unsynchronizedLyrics
            ),
            .comment: ID3LocalizedFrameContentParsingOperationFactory.make(frameName: FrameName.comment),
            .iTunesGrouping: ID3iTunesGroupingFrameContentParsingOperationFactory.make(),
            .iTunesMovementIndex: ID3ParsingOperationForID3FrameWithIntegerFactory.make(frameName: .iTunesMovementIndex),
            .iTunesMovementCount: ID3iTunesMovementCountFrameContentParsingOperationFactory.make(),
            .iTunesMovementName: ID3iTunesMovementNameFrameContentParsingOperationFactory.make()
        ]
    }
}
