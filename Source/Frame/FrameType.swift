//
//  ID3FrameConfiguration.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

enum FrameType: String, Equatable {
    case Artist = "artist"
    case Title = "title"
    case Album = "album"
    case AttachedPicture = "artwork"
    case RecordingYear = "recordingYear"
    case RecodingDateTime = "recodingDateTime"
    case Genre = "genre"
    case TrackPosition = "trackPosition"
    case AlbumArtist = "albumArtist"
    case Invalid = ""

    static func ==(lhs: FrameType, rhs: FrameType) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
