//
//  FrameName.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 02/10/2019.
//  2019 Fabrizio Duroni
//

import Foundation

public enum FrameName: Hashable {
    /// Title frame name.
    case Title
    /// Album frame name.
    case Album
    /// AlbumArtist  frame name.
    case AlbumArtist
    /// Artist frame name.
    case Artist
    /// Genre frame name.
    case Genre
    /// Track Position frame name.
    case TrackPosition
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
}
