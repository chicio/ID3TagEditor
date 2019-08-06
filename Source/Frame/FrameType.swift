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
    case Album = "album"
    case AttachedPicture = "artwork"
    case RecordingDayMonth = "recordingDayMonth"
    case RecordingYear = "recordingYear"
    case RecordingHourMinute = "recordingHourMinute"
    case RecordingDateTime = "recodingDateTime"
    case Genre = "genre"
    case TrackPosition = "trackPosition"
    case AlbumArtist = "albumArtist"
    case Popularimeter = "popularimeter"
    case Invalid = ""

    static func ==(lhs: FrameType, rhs: FrameType) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
