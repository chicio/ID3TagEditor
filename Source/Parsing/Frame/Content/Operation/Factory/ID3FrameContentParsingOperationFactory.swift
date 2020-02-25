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
            .Comment: ID3CommentFrameContentParsingOperationFactory.make(),
            .Composer: ID3ComposerFrameContentParsingOperationFactory.make(),
            .Conductor: ID3ConductorFrameContentParsingOperationFactory.make(),
            .ContentGrouping: ID3ContentGroupingFrameContentParsingOperationFactory.make(),
            .Copyright: ID3CopyrightFrameContentParsingOperationFactory.make(),
            .DiscPosition: ID3DiscPositionFrameContentParsingOperationFactory.make(),
            .EncodedBy: ID3EncodedByFrameContentParsingOperationFactory.make(),
            .EncoderSettings: ID3EncoderSettingsFrameContentParsingOperationFactory.make(),
            .FileOwner: ID3FileOwnerFrameContentParsingOperationFactory.make(),
            .FileType: ID3FileTypeFrameContentParsingOperationFactory.make(),
            .Grouping: ID3GroupingFrameContentParsingOperationFactory.make(),
            .Language: ID3LanguageFrameContentParsingOperationFactory.make(),
            .Lyricist: ID3LyricistFrameContentParsingOperationFactory.make(),
            .MediaType: ID3MediaTypeFrameContentParsingOperationFactory.make(),
            .MixArtist: ID3MixArtistFrameContentParsingOperationFactory.make(),
            .MovementIndex: ID3MovementIndexFrameContentParsingOperationFactory.make(),
            .MovementName: ID3MovementNameFrameContentParsingOperationFactory.make(),
            .PodcastCategory: ID3PodcastCategoryFrameContentParsingOperationFactory.make(),
            .PodcastDescription: ID3PodcastDescriptionFrameContentParsingOperationFactory.make(),
            .PodcastID: ID3PodcastIDFrameContentParsingOperationFactory.make(),
            .PodcastKeywords: ID3PodcastKeywordsFrameContentParsingOperationFactory.make(),
            .Publisher: ID3PublisherFrameContentParsingOperationFactory.make(),
            .SeriesIndex: ID3SeriesIndexFrameContentParsingOperationFactory.make(),
            .Subtitle: ID3SubtitleFrameContentParsingOperationFactory.make(),
            .UnsyncedLyrics: ID3UnsyncedLyricsFrameContentParsingOperationFactory.make(),
            .Title: ID3TitleFrameContentParsingOperationFactory.make(),
            .AttachedPicture: ID3AttachedPictureFrameContentParsingOperationFactory.make(),
            .RecordingDayMonth: ID3RecordingDayMonthFrameContentParsingOperationFactory.make(),
            .RecordingYear: ID3RecordingYearFrameContentParsingOperationFactory.make(),
            .RecordingHourMinute: ID3RecordingHourMinuteFrameContentParsingOperationFactory.make(),
            .RecordingDateTime: ID3RecordingTimeFrameContentParsingOperationFactory.make(),
            .Genre: ID3GenreFrameContentParsingOperationFactory.make(),
            .TrackPosition: ID3TrackPositionFrameContentParsingOperationFactory.make()
        ]
    }
}
