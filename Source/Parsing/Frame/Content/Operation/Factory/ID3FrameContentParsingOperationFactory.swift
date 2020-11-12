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
            .artist: ID3ArtistFrameContentParsingOperationFactory.make(),
            .albumArtist: ID3AlbumArtistFrameContentParsingOperationFactory.make(),
            .album: ID3AlbumFrameContentParsingOperationFactory.make(),
            .composer: ID3ComposerFrameContentParsingOperationFactory.make(),
            .conductor: ID3ConductorFrameContentParsingOperationFactory.make(),
            .contentGrouping: ID3ContentGroupingFrameContentParsingOperationFactory.make(),
            .copyright: ID3CopyrightFrameContentParsingOperationFactory.make(),
            .discPosition: ID3DiscPositionFrameContentParsingOperationFactory.make(),
            .encodedBy: ID3EncodedByFrameContentParsingOperationFactory.make(),
            .encoderSettings: ID3EncoderSettingsFrameContentParsingOperationFactory.make(),
            .fileOwner: ID3FileOwnerFrameContentParsingOperationFactory.make(),
            .lyricist: ID3LyricistFrameContentParsingOperationFactory.make(),
            .mixArtist: ID3MixArtistFrameContentParsingOperationFactory.make(),
            .iTunesPodcastCategory: ID3iTunesPodcastCategoryFrameContentParsingOperationFactory.make(),
            .iTunesPodcastDescription: ID3iTunesPodcastDescriptionFrameContentParsingOperationFactory.make(),
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
