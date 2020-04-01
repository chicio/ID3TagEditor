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
    /// Album frame name.
    case Album
    /// AlbumArtist  frame name.
    case AlbumArtist
    /// Arranger/Remixer frame name.
    case Arranger
    /// Artist frame name.
    case Artist
    /// Artist Website URL frame name
    case ArtistUrl
    /// AudioSource URL frame name
    case AudioSourceUrl
    /// Beats per Minute frame
    case BPM
    /// Chapter frame nme. Valid only for tag version 2.3 and 2.4
    //case Chapter
    /// Comment frame name
    case Comment
    /// Compilation flag. ITunes Specific.
    case ITunesCompilation
    /// Composer frame name.
    case Composer
    /// Conductor frame name.
    case Conductor
    /// ContentGroup frame name. AKA WorkName
    case ContentGroup
    /// Copyright frame name.
    case Copyright
    /// Copyright URL frame name
    case CopyrightUrl
    /// Disc Position frame name.
    case DiscPosition
    /// EncodedBy frame name.
    case EncodedBy
    /// EncoderSettings frame name.
    case EncoderSettings
    /// File Owner frame name. Version 2.3 and 2.4 only.
    case FileOwner
    /// File type frame name.
    case FileType
    /// File URL frame name
    case AudioFileUrl
    /// Genre frame name.
    case Genre
    /// Initial Key frame name
    case InitialKey
    /// InvolvedPeople frame name. IPLS for version 2.3, TIPL for version 2.4
    //case InvolvedPeople
    /// ISRC frame name
    case ISRC
    /// Grouping frame name. Version 2.3 and 2.4 only.
    case ITunesGrouping
    /// Movement Count frame name. Version 2.3 and 2.4 only
    case ITunesMovementCount
    /// Movement Index frame name. Version 2.3 and 2.4 only.
    case ITunesMovementIndex
    ///Movement name frame name.
    case ITunesMovementName
    /// Language frame name
    case Language
    /// Length frame name
    case Length
    /// Lyricist frame name
    case Lyricist
    /// Media type frame name.
    case MediaType
    /// Mood frame name
    case Mood
    /// MusicianCredits frame name
    //case MusicianCredits
    /// Original Album frame name
    case OriginalAlbum
    /// OriginalArtist frame name
    case OriginalArtist
    /// Original Date frame name. TORY for 2.3, TDOR for 2.4
    case OriginalYear
    /// Original Filename frame name
    case OriginalFilename
    /// Original Lyricist frame name
    case OriginalLyricist
    /// Payment URL frame name
    case PaymentUrl
    /// Playlist Delay frame name
    case PlaylistDelay
    /// Podcast frame name
    case Podcast
    /// Podcast category frame name. Version 2.3 and 2.4 only.
    case PodcastCategory
    /// Podcast Description frame name. Version 2.3 and 2.4 only.
    case PodcastDescription
    /// Podcast ID frame name, Version 2.3 and 2.4 only.
    case PodcastID
    /// Podcast keywords frame name, Version 2.3 and 2.4 only.
    case PodcastKeywords
    /// PodcastURL frame name
    case PodcastUrl
    /// Publisher frame name.
    case Publisher
    /// Publisher URL frame name
    case PublisherUrl
    /// Radio Station frame name
    case RadioStation
    /// Radio Station Owner frame name
    case RadioStationOwner
    /// Radio Station URL frame name
    case RadioStationUrl
    /// Set Subtitle frame name. Version 2.4 only
    case SetSubtitle
    /// Album Sort frame name
    case SortAlbum
    /// AlbumArtist Sort frame name
    case SortAlbumArtist
    /// Artist Sort frame name
    case SortArtist
    /// Composer Sort frame name
    case SortComposer
    /// Performer Sort frame name
    case SortPerformer
    /// TitleSort frame name
    case SortTitle
    /// Subtitle frame name
    case Subtitle
    /// Table of Contents frame name. Valid only for tag version 2.3 and 2.4
    //case TableOfContents
    /// Title frame name.
    case Title
    /// Track Position frame name.
    case TrackPosition
    /// Unsynced lyrics frame name
    case UnsyncedLyrics
    /// User Defined Text Information
    case UserDefinedTextInformation
    /// User Defined URL frame name
    case UserDefinedUrl
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
    
    internal var fourByteString: String? {
        switch self {
            case .Comment:
                return "COMM"
            case .UnsyncedLyrics:
                return "USLT"
            case .UserDefinedTextInformation:
                return "TXXX"
            case .UserDefinedUrl:
                return "WXXX"
            default:
                return nil
        }
    }
    
    internal var threeByteString: String? {
        switch self {
            case .Comment:
                return "COM"
            case .UnsyncedLyrics:
                return "ULT"
            case .UserDefinedTextInformation:
                return "TXX"
            case .UserDefinedUrl:
                return "WXX"
            default:
                return nil
        }
    }
}
