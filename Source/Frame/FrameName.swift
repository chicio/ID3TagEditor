//
//  FrameName.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 02/10/2019.
//  2019 Fabrizio Duroni
//

import Foundation

/// An enum used to identify the different types of frame parsed by the ID3TagEditor. This must be used to acces the frame data as identifier inside the dictionary
/// of frame in the `ID3tag` `frames` properties.
public enum FrameName: Hashable {
    /// Title frame name.
    case Title
    /// Album frame name.
    case Album
    /// AlbumArtist  frame name.
    case AlbumArtist
    /// Artist frame name.
    case Artist
    /// Composer frame name.
    case Composer
    /// Conductor frame name.
    case Conductor
    /// ContentGrouping frame name.
    case ContentGrouping
    /// Copyright frame name.
    case Copyright
    /// EncodedBy frame name.
    case EncodedBy
    /// EncoderSettings frame name.
    case EncoderSettings
    /// File Owner frame name. Version 2.3 and 2.4 only.
    case FileOwner
    /// File type frame name.
    case FileType
    /// Grouping frame name. Version 2.3 and 2.4 only.
    case ITunesGrouping
    /// Lyricist frame name
    case Lyricist
    /// Media type frame name.
    case MediaType
    /// Mix Artist frame name.
    case MixArtist
    ///Movement name frame name.
    case ITunesMovementName
    /// Movement Index frame name. Version 2.3 and 2.4 only.
    case ITunesMovementIndex
    /// Movement Count frame name. Version 2.3 and 2.4 only
    case ITunesMovementCount
    /// Podcast category frame name. Version 2.3 and 2.4 only.
    case PodcastCategory
    /// Podcast Description frame name. Version 2.3 and 2.4 only.
    case PodcastDescription
    /// Podcast ID frame name, Version 2.3 and 2.4 only.
    case PodcastID
    /// Podcast keywords frame name, Version 2.3 and 2.4 only.
    case PodcastKeywords
    /// Publisher frame name.
    case Publisher
    /// Subtitle frame name
    case Subtitle
    /// Unsynced lyrics frame name
    case UnsyncedLyrics
    /// Genre frame name.
    case Genre
    /// Disc Position frame name.
    case DiscPosition
    /// Track Position frame name.
    case TrackPosition
    /// RecordingDayMonth frame name. Valid only for tag version 2.3 and 2.2. For version 2.4 use RecordingDateTime.
    case RecordingDayMonth
    /// RecordingYear frame name. Valid only for tag version 2.3 and 2.2. For version 2.4 use RecordingDateTime.
    case RecordingYear
    /// RecordingHourMinute frame name. Valid only for tag version 2.3 and 2.2. For version 2.4 use RecordingDateTime.
    case RecordingHourMinute
    /// RecordingDateTime frame name. Valid only for tag version 2.4. For version 2.2 and 2.3 use RecordingDateTime.
    case RecordingDateTime
    /// AttachedPicture frame name
    /// - pictureType:
    case AttachedPicture(_ pictureType: ID3PictureType)
}
