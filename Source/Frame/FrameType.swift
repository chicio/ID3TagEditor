//
//  ID3FrameConfiguration.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

enum FrameType: String, Equatable {
    case title = "title"
    case artist = "artist"
    case composer = "composer"
    case conductor = "conductor"
    case contentGrouping = "contentGrouping"
    case copyright = "copyright"
    case encodedBy = "encodedBy"
    case encoderSettings = "encoderSettings"
    case fileOwner = "fileOwner"
    case lyricist = "lyricist"
    case mixArtist = "mixArtist"
    case publisher = "publisher"
    case subtitle = "subtitle"
    case album = "album"
    case attachedPicture = "artwork"
    case recordingDayMonth = "recordingDayMonth"
    case recordingYear = "recordingYear"
    case recordingHourMinute = "recordingHourMinute"
    case recordingDateTime = "recodingDateTime"
    case genre = "genre"
    case trackPosition = "trackPosition"
    case discPosition = "discPosition"
    case albumArtist = "albumArtist"
    case unsyncronisedLyrics = "unsyncronisedLyrics"
    case iTunesGrouping = "iTunesGrouping"
    case iTunesMovementName = "iTunesMovementName"
    case iTunesMovementIndex = "iTunesMovementIndex"
    case iTunesMovementCount = "iTunesMovementCount"
    case iTunesPodcastCategory = "iTunesPodcastCategory"
    case iTunesPodcastDescription = "iTunesPodcastDescription"
    case iTunesPodcastID = "iTunesPodcastID"
    case iTunesPodcastKeywords = "iTunesPodcastKeywords"
    case invalid = ""
    case beatsPerMinute = "beatsPerMinute"
    case contentType = "contentType"
    case playlistDelay = "playlistDelay"
    case fileType = "fileType"
    case time = "time"
    case initialKey = "initialKey"
    case languages = "languages"
    case length = "length"
    case mediaType = "mediaType"
    case originalAlbumTitle = "originalAlbumTitle"
    case originalFilename = "originalFilename"
    case originalLyricists = "originalLyricists"
    case originalArtists = "originalArtists"
    case originalReleaseYear = "originalReleaseYear"
    case recordingDate = "recordingDate"
    case internetRadioStationName = "internetRadioStationName"
    case internetRadioStationOwner = "internetRadioStationOwner"
    case size = "size"
    case internationalStandardRecordingCode = "internationalStandardRecordingCode"
    case year = "year"
    static func == (lhs: FrameType, rhs: FrameType) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
