//
//  ID3Frame.swift
//
//  Created by Fabrizio Duroni on 31/12/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

public enum FrameName: Hashable {
    case Title
    case Album
    case AlbumArtist
    case Artist
    case Genre
    case TrackPosition
    // only v3/2, for v4 use RecordingDateTime
    case RecordingDayMonth
    // only v3/2, for v4 use RecordingDateTime
    case RecordingYear
    // only v3/2, for v4 use RecordingDateTime
    case RecordingHourMinute
    // only v4, for v3/2 use RecordingDayMonth, RecordingYear, RecordingHourMinute
    case RecordingDateTime
    case AttachedPicture(ID3PictureType)
}
/**.
 A class that contains the basic features of a frame.
 */
public class ID3Frame {
    public internal(set) var id3Identifier: String?
    
    
}
