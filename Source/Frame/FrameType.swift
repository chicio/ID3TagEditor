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
    case Year = "year"
    case Genre = "genre"
    case TrackPosition = "trackPosition"
    case Invalid = ""

    static func ==(lhs: FrameType, rhs: FrameType) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
