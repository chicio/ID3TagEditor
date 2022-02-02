//
//  ID3TagFramesReader.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 02/02/22.
//  Copyright © 2022 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3TagReader {
    private let id3Tag: ID3Tag

    init(id3Tag: ID3Tag) {
        self.id3Tag = id3Tag
    }

    func title() -> String? {
        return (id3Tag.frames[.title] as? ID3FrameWithStringContent)?.content
    }
    
    func album() -> String? {
        return (id3Tag.frames[.album] as? ID3FrameWithStringContent)?.content
    }
    
    func albumArtist() -> String? {
        return (id3Tag.frames[.albumArtist] as? ID3FrameWithStringContent)?.content
    }
    
    func artist() -> String? {
        return (id3Tag.frames[.artist] as? ID3FrameWithStringContent)?.content
    }
    
//    /// Composer frame name.
//    case composer
//    /// Conductor frame name.
//    case conductor
//    /// ContentGrouping frame name.
//    case contentGrouping
//    /// Copyright frame name.
//    case copyright
//    /// EncodedBy frame name.
//    case encodedBy
//    /// EncoderSettings frame name.
//    case encoderSettings
//    /// File Owner frame name. Version 2.3 and 2.4 only.
//    case fileOwner
//    /// Lyricist frame name
//    case lyricist
//    /// Mix Artist frame name.
//    case mixArtist
//    /// Publisher frame name.
//    case publisher
//    /// Subtitle frame name
//    case subtitle
//    /// Beats per minute frame name.
//    case beatsPerMinute
//    /// Original filename.
//    case originalFilename
//    /// Length in milliseconds frame.
//    case lengthInMilliseconds
//    /// Size in bytes frame. Valid only for tag version 2.2 and 2.3.
//    case sizeInBytes
//    /// Genre frame name.
//    case genre
//    /// Disc Position frame name.
//    case discPosition
//    /// Track Position frame name.
//    case trackPosition
//    /// RecordingDayMonth frame name. Valid only for tag version 2.3 and 2.2. For version 2.4 use RecordingDateTime.
//    case recordingDayMonth
//    /// RecordingYear frame name. Valid only for tag version 2.3 and 2.2. For version 2.4 use RecordingDateTime.
//    case recordingYear
//    /// RecordingHourMinute frame name. Valid only for tag version 2.3 and 2.2. For version 2.4 use RecordingDateTime.
//    case recordingHourMinute
//    /// RecordingDateTime frame name. Valid only for tag version 2.4. For version 2.2 and 2.3 use RecordingDateTime.
//    case recordingDateTime
//    /// AttachedPicture frame name
//    /// - pictureType:
//    case attachedPicture(_ pictureType: ID3PictureType)
//    /// Unsynchronized lyrics frame name.
//    /// - language: language of the lyrics, according to the ISO-639-2 standard.
//    case unsynchronizedLyrics(_ language: ID3FrameContentLanguage)
//    /// Comment frame name.
//    /// - language: language of the comment, according to the ISO-639-2 standard.
//    case comment(_ language: ID3FrameContentLanguage)
//    /// Grouping frame name. Version 2.3 and 2.4 only.
//    case iTunesGrouping
//    /// Movement name frame name. Version 2.3 and 2.4 only.
//    case iTunesMovementName
//    /// Movement Index frame name. Version 2.3 and 2.4 only.
//    case iTunesMovementIndex
//    /// Movement Count frame name. Version 2.3 and 2.4 only
//    case iTunesMovementCount
//    /// Podcast category frame name. Version 2.3 and 2.4 only.
//    case iTunesPodcastCategory
//    /// Podcast Description frame name. Version 2.3 and 2.4 only.
//    case iTunesPodcastDescription
//    /// Podcast ID frame name, Version 2.3 and 2.4 only.
//    case iTunesPodcastID
//    /// Podcast keywords frame name, Version 2.3 and 2.4 only.
//    case iTunesPodcastKeywords
}
