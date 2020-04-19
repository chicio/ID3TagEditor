//
//  ID3FrameConfiguration.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

enum FrameType: String, Equatable {
    case Title = "title"
    case Artist = "artist"
    case Composer = "composer"
    case Conductor = "conductor"
    case ContentGrouping = "contentGrouping"
    case Copyright = "copyright"
    case EncodedBy = "encodedBy"
    case EncoderSettings = "encoderSettings"
    case FileOwner = "fileOwner"
    case Lyricist = "lyricist"
    case MixArtist = "mixArtist"
    case Publisher = "publisher"
    case Subtitle = "subtitle"
    case Album = "album"
    case AttachedPicture = "artwork"
    case RecordingDayMonth = "recordingDayMonth"
    case RecordingYear = "recordingYear"
    case RecordingHourMinute = "recordingHourMinute"
    case RecordingDateTime = "recodingDateTime"
    case Genre = "genre"
    case TrackPosition = "trackPosition"
    case DiscPosition = "discPosition"
    case AlbumArtist = "albumArtist"
    case iTunesGrouping = "iTunesGrouping"
    case iTunesMovementName = "iTunesMovementName"
    case iTunesMovementIndex = "iTunesMovementIndex"
    case iTunesMovementCount = "iTunesMovementCount"
    case iTunesPodcastCategory = "iTunesPodcastCategory"
    case iTunesPodcastDescription = "iTunesPodcastDescription"
    case iTunesPodcastID = "iTunesPodcastID"
    case iTunesPodcastKeywords = "iTunesPodcastKeywords"
    case Invalid = ""

    static func ==(lhs: FrameType, rhs: FrameType) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
