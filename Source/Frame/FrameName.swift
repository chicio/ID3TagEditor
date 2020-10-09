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
public enum FrameName: Equatable, Hashable, CaseIterable {
    public static var allCases: [FrameName] {
        return [
            .Title,
            .Album,
            .AlbumArtist,
            .Artist,
            .Composer,
            .Conductor,
            .ContentGrouping,
            .Copyright,
            .EncodedBy,
            .EncoderSettings,
            .FileOwner,
            .Lyricist,
            .MixArtist,
            .Publisher,
            .Subtitle,
            .Genre,
            .DiscPosition,
            .TrackPosition,
            .RecordingDayMonth,
            .RecordingYear,
            .RecordingHourMinute,
            .RecordingDateTime,
            .AttachedPicture(.Other),
            .AttachedPicture(.Other),
            .AttachedPicture(.fileIcon),
            .AttachedPicture(.OtherFileIcon),
            .AttachedPicture(.FrontCover),
            .AttachedPicture(.BackCover),
            .AttachedPicture(.LeafletPage),
            .AttachedPicture(.Media),
            .AttachedPicture(.LeadArtistLeadPerformerSoloist),
            .AttachedPicture(.ArtistPerformer),
            .AttachedPicture(.Conductor),
            .AttachedPicture(.BandOrchestra),
            .AttachedPicture(.Composer),
            .AttachedPicture(.LyricistTextWriter),
            .AttachedPicture(.RecordingLocation),
            .AttachedPicture(.DuringRecording),
            .AttachedPicture(.DuringPerformance),
            .AttachedPicture(.MovieVideoScreenCapture),
            .AttachedPicture(.ABrightColouredFish),
            .AttachedPicture(.Illustration),
            .AttachedPicture(.BandArtistLogotype),
            .AttachedPicture(.PublisherStudioLogotype),
            .UnsynchronizedLyrics(.ita),
            .iTunesGrouping,
            .iTunesMovementName,
            .iTunesMovementIndex,
            .iTunesMovementCount,
            .iTunesPodcastCategory,
            .iTunesPodcastDescription,
            .iTunesPodcastID,
            .iTunesPodcastKeywords
        ]
    }
    
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
    /// Lyricist frame name
    case Lyricist
    /// Mix Artist frame name.
    case MixArtist
    /// Publisher frame name.
    case Publisher
    /// Subtitle frame name
    case Subtitle
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
    /// Unsynchronized lyrics frame name
    /// - language: language of the lyrics, according to the ISO-639-2 standard
    case UnsynchronizedLyrics(_ language: ID3FrameContentLanguage)
    /// Grouping frame name. Version 2.3 and 2.4 only.
    case iTunesGrouping
    ///Movement name frame name.
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
