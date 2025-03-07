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
    case initialKey = "initialKey"
    case discPosition = "discPosition"
    case albumArtist = "albumArtist"
    case beatsPerMinute = "beatsPerMinute"
    case originalFilename = "originalFilename"
    case lengthInMilliseconds = "lengthInMilliseconds"
    case sizeInBytes = "sizeInBytes"
    case unsyncronisedLyrics = "unsyncronisedLyrics"
    case comment = "comment"
    case iTunesGrouping = "iTunesGrouping"
    case iTunesMovementName = "iTunesMovementName"
    case iTunesMovementIndex = "iTunesMovementIndex"
    case iTunesMovementCount = "iTunesMovementCount"
    case iTunesPodcastCategory = "iTunesPodcastCategory"
    case iTunesPodcastDescription = "iTunesPodcastDescription"
    case iTunesPodcastID = "iTunesPodcastID"
    case iTunesPodcastKeywords = "iTunesPodcastKeywords"
    case invalid = ""

    static func == (lhs: FrameType, rhs: FrameType) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
