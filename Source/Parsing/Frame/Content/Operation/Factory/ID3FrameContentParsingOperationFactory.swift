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
            .Album: ID3AlbumFrameContentParsingOperationFactory.make(),
            .AlbumArtist: ID3AlbumArtistFrameContentParsingOperationFactory.make(),
            .Arranger: ID3ArrangerFrameContentParsingOperationFactory.make(),
            .Artist: ID3ArtistFrameContentParsingOperationFactory.make(),
            .ArtistUrl: ID3ArtistUrlFrameContentParsingOperationFactory.make(),
            .AudioFileUrl: ID3AudioFileUrlFrameContentParsingOperationFactory.make(),
            .AudioSourceUrl: ID3AudioSourceUrlFrameContentParsingOperationFactory.make(),
            .BPM: ID3BPMFrameContentParsingOperationFactory.make(),
            .Comment: ID3CommentFrameContentParsingOperation(frameName: .Comment),
            .Composer: ID3ComposerFrameContentParsingOperationFactory.make(),
            .Conductor: ID3ConductorFrameContentParsingOperationFactory.make(),
            .ContentGroup: ID3ContentGroupFrameContentParsingOperationFactory.make(),
            .Copyright: ID3CopyrightFrameContentParsingOperationFactory.make(),
            .CopyrightUrl: ID3CopyrightUrlFrameContentParsingOperationFactory.make(),
            .DiscPosition: ID3DiscPositionFrameContentParsingOperationFactory.make(),
            .EncodedBy: ID3EncodedByFrameContentParsingOperationFactory.make(),
            .EncoderSettings: ID3EncoderSettingsFrameContentParsingOperationFactory.make(),
            .FileOwner: ID3FileOwnerFrameContentParsingOperationFactory.make(),
            .FileType: ID3FileTypeFrameContentParsingOperationFactory.make(),
            .Genre: ID3GenreFrameContentParsingOperationFactory.make(),
            .InitialKey: ID3InitialKeyFrameContentParsingOperationFactory.make(),
            .ISRC: ID3ISRCFrameContentParsingOperationFactory.make(),
            .ITunesCompilation: ID3ITunesCompilationFlagFrameContentParsingOperationFactory.make(),
            .ITunesGrouping: ID3iTunesGroupingFrameContentParsingOperationFactory.make(),
            .ITunesMovementCount: ID3ITunesMovementCountFrameContentParsingOperationFactory.make(),
            .ITunesMovementIndex: ID3ITunesMovementIndexFrameContentParsingOperationFactory.make(),
            .ITunesMovementName: ID3ItunesMovementNameFrameContentParsingOperationFactory.make(),
            .Language: ID3LanguageFrameContentParsingOperationFactory.make(),
            .Length: ID3LengthFrameContentParsingOperationFactory.make(),
            .Lyricist: ID3LyricistFrameContentParsingOperationFactory.make(),
            .MediaType: ID3MediaTypeFrameContentParsingOperationFactory.make(),
            .Mood: ID3MoodFrameContentParsingOperationFactory.make(),
            .OriginalAlbum: ID3OriginalAlbumFrameContentParsingOperationFactory.make(),
            .OriginalArtist: ID3OriginalArtistFrameContentParsingOperationFactory.make(),
            .OriginalFilename: ID3OriginalFilenameFrameContentParsingOperationFactory.make(),
            .OriginalLyricist: ID3OriginalLyricistFrameContentParsingOperationFactory.make(),
            .PlaylistDelay: ID3PlaylistDelayFrameContentParsingOperationFactory.make(),
            .PodcastUrl: ID3PodcastUrlFrameContentParsingOperationFactory.make(),
            .PodcastCategory: ID3PodcastCategoryFrameContentParsingOperationFactory.make(),
            .PodcastDescription: ID3PodcastDescriptionFrameContentParsingOperationFactory.make(),
            .PodcastID: ID3PodcastIDFrameContentParsingOperationFactory.make(),
            .PodcastKeywords: ID3PodcastKeywordsFrameContentParsingOperationFactory.make(),
            .Publisher: ID3PublisherFrameContentParsingOperationFactory.make(),
            .PublisherUrl: ID3PublisherUrlFrameContentParsingOperationFactory.make(),
            .RadioStation: ID3RadioStationFrameContentParsingOperationFactory.make(),
            .RadioStationOwner: ID3RadioStationOwnerFrameContentParsingOperationFactory.make(),
            .RadioStationUrl: ID3RadioStationUrlFrameContentParsingOperationFactory.make(),
            .SetSubtitle: ID3SetSubtitleFrameContentParsingOperationFactory.make(),
            .SortAlbum: ID3SortAlbumFrameContentParsingOperationFactory.make(),
            .SortAlbumArtist: ID3SortAlbumArtistFrameContentParsingOperationFactory.make(),
            .SortArtist: ID3SortArtistFrameContentParsingOperationFactory.make(),
            .SortComposer: ID3SortComposerFrameContentParsingOperationFactory.make(),
            .SortTitle: ID3SortTitleFrameContentParsingOperationFactory.make(),
            .Subtitle: ID3SubtitleFrameContentParsingOperationFactory.make(),
            .Title: ID3TitleFrameContentParsingOperationFactory.make(),
            .TrackPosition: ID3TrackPositionFrameContentParsingOperationFactory.make(),
            .UnsyncedLyrics: ID3CommentFrameContentParsingOperation(frameName: .UnsyncedLyrics),
            .UserDefinedTextInformation: ID3UserTextFrameContentParsingOperation(frameName: .UserDefinedTextInformation),
            .UserDefinedUrl: ID3UserTextFrameContentParsingOperation(frameName: .UserDefinedUrl),
            .AttachedPicture: ID3AttachedPictureFrameContentParsingOperationFactory.make(),
            .RecordingDayMonth: ID3RecordingDayMonthFrameContentParsingOperationFactory.make(),
            .RecordingYear: ID3RecordingYearFrameContentParsingOperationFactory.make(),
            .RecordingHourMinute: ID3RecordingHourMinuteFrameContentParsingOperationFactory.make(),
            .RecordingDateTime: ID3RecordingTimeFrameContentParsingOperationFactory.make(),
        ]
    }
}
