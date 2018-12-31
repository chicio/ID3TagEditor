//
//  ID3FrameConfiguration.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 Enum that describes the different types of frames available.
 The frame type from different ID3 tag version are all mapped on this common types inside the ID3TagEditor. For example
 the ```Title``` frame type corresponds to the ```TT2``` in version 2 and to ```TIT2``` for version 3 and 4.
 */
public enum FrameType: String, Equatable {
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
    case Invalid = ""

    public static func ==(lhs: FrameType, rhs: FrameType) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
