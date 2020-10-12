//
//  ID3FrameContentParsingOperationFactory.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameContentParsingOperationFactory {
    static func make() -> [FrameType : FrameContentParsingOperation] {
        return [
            .Artist: ID3ArtistFrameContentParsingOperationFactory.make(),
            .AlbumArtist: ID3AlbumArtistFrameContentParsingOperationFactory.make(),
            .Album: ID3AlbumFrameContentParsingOperationFactory.make(),
            .Composer: ID3ComposerFrameContentParsingOperationFactory.make(),
            .Conductor: ID3ConductorFrameContentParsingOperationFactory.make(),
            .ContentGrouping: ID3ContentGroupingFrameContentParsingOperationFactory.make(),
            .Copyright: ID3CopyrightFrameContentParsingOperationFactory.make(),
            .DiscPosition: ID3DiscPositionFrameContentParsingOperationFactory.make(),
            .EncodedBy: ID3EncodedByFrameContentParsingOperationFactory.make(),
            .EncoderSettings: ID3EncoderSettingsFrameContentParsingOperationFactory.make(),
            .FileOwner: ID3FileOwnerFrameContentParsingOperationFactory.make(),
            .Lyricist: ID3LyricistFrameContentParsingOperationFactory.make(),
            .MixArtist: ID3MixArtistFrameContentParsingOperationFactory.make(),
            .iTunesPodcastCategory: ID3iTunesPodcastCategoryFrameContentParsingOperationFactory.make(),
            .iTunesPodcastDescription: ID3iTunesPodcastDescriptionFrameContentParsingOperationFactory.make(),
            .iTunesPodcastID: ID3iTunesPodcastIDFrameContentParsingOperationFactory.make(),
            .iTunesPodcastKeywords: ID3iTunesPodcastKeywordsFrameContentParsingOperationFactory.make(),
            .Publisher: ID3PublisherFrameContentParsingOperationFactory.make(),
            .Subtitle: ID3SubtitleFrameContentParsingOperationFactory.make(),
            .Title: ID3TitleFrameContentParsingOperationFactory.make(),
            .AttachedPicture: ID3AttachedPictureFrameContentParsingOperationFactory.make(),
            .RecordingDayMonth: ID3RecordingDayMonthFrameContentParsingOperationFactory.make(),
            .RecordingYear: ID3RecordingYearFrameContentParsingOperationFactory.make(),
            .RecordingHourMinute: ID3RecordingHourMinuteFrameContentParsingOperationFactory.make(),
            .RecordingDateTime: ID3RecordingTimeFrameContentParsingOperationFactory.make(),
            .Genre: ID3GenreFrameContentParsingOperationFactory.make(),
            .TrackPosition: ID3TrackPositionFrameContentParsingOperationFactory.make(),
            .UnsyncronisedLyrics: ID3UnsynchronisedLyricsFrameContentParsingOperationFactory.make(),
            .iTunesGrouping: ID3iTunesGroupingFrameContentParsingOperationFactory.make(),
            .iTunesMovementIndex: ID3iTunesMovementIndexFrameContentParsingOperationFactory.make(),
            .iTunesMovementCount: ID3iTunesMovementCountFrameContentParsingOperationFactory.make(),
            .iTunesMovementName: ID3iTunesMovementNameFrameContentParsingOperationFactory.make()
        ]
    }
}
