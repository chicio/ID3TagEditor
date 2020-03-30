//
//  ID3FrameConfiguration.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

enum FrameType: String, Equatable {
    case Title = "title"
    case Album = "album"
    case AlbumArtist = "albumArtist"
    case Artist = "artist"
    case Composer = "composer"
    case Conductor = "conductor"
    case ContentGroup = "ContentGroup"
    case Copyright = "copyright"
    case EncodedBy = "encodedBy"
    case EncoderSettings = "encoderSettings"
    case FileOwner = "fileOwner"
    case FileType = "fileType"
    case ITunesGrouping = "iTunesGrouping"
    case Lyricist = "lyricist"
    case MediaType = "mediaType"
    case Arranger = "Arranger"
    case ITunesMovementName = "iTunesMovementName"
    case ITunesMovementIndex = "iTunesMovementIndex"
    case ITunesMovementCount = "iTunesMovementCount"
    case PodcastCategory = "podcastCategory"
    case PodcastDescription = "podcastDescription"
    case PodcastID = "podcastID"
    case PodcastKeywords = "podcastKeywords"
    case Publisher = "publisher"
    case Subtitle = "subtitle"
    case UnsyncedLyrics = "unsyncedLyrics"
    case Comment = "comment"
    case Language = "language"
    case AttachedPicture = "artwork"
    case RecordingDayMonth = "recordingDayMonth"
    case RecordingYear = "recordingYear"
    case RecordingHourMinute = "recordingHourMinute"
    case RecordingDateTime = "recodingDateTime"
    case Genre = "genre"
    case TrackPosition = "trackPosition"
    case DiscPosition = "discPosition"
    case UserDefinedTextInformation = "userDefinedTextInformation"
    case TableOfContents = "tableOfContents"
    case Chapter = "chapter"
    case Invalid = ""

    static func ==(lhs: FrameType, rhs: FrameType) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
