//
//  FrameName.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 02.10.19.
//  2019 Fabrizio Duroni
//

import Foundation

struct FrameNamesWithLocalizedContent {
    func get() -> [FrameType: [FrameName]] {
        return [
            FrameType.unsyncronisedLyrics: enumerateLocalizedFrameName(frameName: FrameName.unsynchronizedLyrics),
            FrameType.comment: enumerateLocalizedFrameName(frameName: FrameName.comment)
        ]
    }

    private func enumerateLocalizedFrameName(frameName: (ID3FrameContentLanguage) -> FrameName) -> [FrameName] {
        return ID3FrameContentLanguage.allCases.map({ frameName($0) })
    }
}

/// An enum used to identify the different types of frame parsed by the ID3TagEditor.
/// This must be used to acces the frame data as identifier inside the dictionary
/// of frame in the `ID3tag` `frames` properties.
public enum FrameName: Equatable, Hashable, CaseIterable {
    public static var allCases: [FrameName] {
        let frameNamesWithLocalizedContent = FrameNamesWithLocalizedContent().get()
        return [
            .title,
            .album,
            .albumArtist,
            .artist,
            .composer,
            .conductor,
            .contentGrouping,
            .copyright,
            .encodedBy,
            .encoderSettings,
            .fileOwner,
            .lyricist,
            .mixArtist,
            .publisher,
            .subtitle,
            .genre,
            .discPosition,
            .trackPosition,
            .initialKey,
            .recordingDayMonth,
            .recordingYear,
            .recordingHourMinute,
            .recordingDateTime,
            .iTunesGrouping,
            .iTunesMovementName,
            .iTunesMovementIndex,
            .iTunesMovementCount,
            .iTunesPodcastCategory,
            .iTunesPodcastDescription,
            .iTunesPodcastID,
            .iTunesPodcastKeywords
        ]
        + frameNamesWithLocalizedContent[FrameType.unsyncronisedLyrics]!
        + frameNamesWithLocalizedContent[FrameType.comment]!
    }

    /// Title frame name.
    case title
    /// Album frame name.
    case album
    /// AlbumArtist  frame name.
    case albumArtist
    /// Artist frame name.
    case artist
    /// Composer frame name.
    case composer
    /// Conductor frame name.
    case conductor
    /// ContentGrouping frame name.
    case contentGrouping
    /// Copyright frame name.
    case copyright
    /// EncodedBy frame name.
    case encodedBy
    /// EncoderSettings frame name.
    case encoderSettings
    /// File Owner frame name. Version 2.3 and 2.4 only.
    case fileOwner
    /// Lyricist frame name
    case lyricist
    /// Mix Artist frame name.
    case mixArtist
    /// Publisher frame name.
    case publisher
    /// Subtitle frame name
    case subtitle
    /// Beats per minute frame name.
    case beatsPerMinute
    /// Original filename.
    case originalFilename
    /// Length in milliseconds frame.
    case lengthInMilliseconds
    /// Size in bytes frame. Valid only for tag version 2.2 and 2.3.
    case sizeInBytes
    /// Genre frame name.
    case genre
    /// Disc Position frame name.
    case discPosition
    /// Track Position frame name.
    case trackPosition
    /// Initial key frame name.
    case initialKey
    /// RecordingDayMonth frame name. Valid only for tag version 2.3 and 2.2. For version 2.4 use RecordingDateTime.
    case recordingDayMonth
    /// RecordingYear frame name. Valid only for tag version 2.3 and 2.2. For version 2.4 use RecordingDateTime.
    case recordingYear
    /// RecordingHourMinute frame name. Valid only for tag version 2.3 and 2.2. For version 2.4 use RecordingDateTime.
    case recordingHourMinute
    /// RecordingDateTime frame name. Valid only for tag version 2.4. For version 2.2 and 2.3 use RecordingDateTime.
    case recordingDateTime
    /// AttachedPicture frame name
    /// - pictureType:
    case attachedPicture(_ pictureType: ID3PictureType)
    /// Unsynchronized lyrics frame name.
    /// - language: language of the lyrics, according to the ISO-639-2 standard.
    case unsynchronizedLyrics(_ language: ID3FrameContentLanguage)
    /// Comment frame name.
    /// - language: language of the comment, according to the ISO-639-2 standard.
    case comment(_ language: ID3FrameContentLanguage)
    /// Grouping frame name. Version 2.3 and 2.4 only.
    case iTunesGrouping
    /// Movement name frame name. Version 2.3 and 2.4 only.
    case iTunesMovementName
    /// Movement Index frame name. Version 2.3 and 2.4 only.
    case iTunesMovementIndex
    /// Movement Count frame name. Version 2.3 and 2.4 only
    case iTunesMovementCount
    /// Podcast category frame name. Version 2.3 and 2.4 only.
    case iTunesPodcastCategory
    /// Podcast Description frame name. Version 2.3 and 2.4 only.
    case iTunesPodcastDescription
    /// Podcast ID frame name, Version 2.3 and 2.4 only.
    case iTunesPodcastID
    /// Podcast keywords frame name, Version 2.3 and 2.4 only.
    case iTunesPodcastKeywords
}
