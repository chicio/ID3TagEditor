//
//  ID3Tag.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A class used to represent an ID3 tag.
 */
public class ID3Tag: CustomDebugStringConvertible {
    /// The properties of the tag. The public available property to the user of the frmaework is the versions property.
    public var properties: TagProperties
    /// Dictionary that contains the frames extracted or to be added to the id3 tag for an mp3 file.
    public lazy var frames: [FrameName : ID3Frame] = {
        return [:]
    }()
    /// ID3Tag description, useful for debug.
    public var debugDescription: String {
        return """
        ID3Tag:
        - size: \(self.properties.size)
        - version: \(self.properties.version)
        - artist: \((self.frames[.Artist] as? ID3FrameWithStringContent)?.content ?? "-")
        - albumArtist: \((self.frames[.AlbumArtist] as? ID3FrameWithStringContent)?.content ?? "-")
        - title: \((self.frames[.Title] as? ID3FrameWithStringContent)?.content ?? "-")
        - trackPosition: \((self.frames[.TrackPosition] as? ID3FrameTrackPosition)?.debugDescription ?? "-")
        - album: \((self.frames[.Album] as? ID3FrameWithStringContent)?.content ?? "-")
        - recordingDateTime: \(
            (self.frames[.RecordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.debugDescription ?? "-"
        )
        - recordingYear: \((self.frames[.RecordingYear] as? ID3FrameRecordingYear)?.debugDescription ?? "-")
        - recordingDayMonth: \((self.frames[.RecordingDayMonth] as? ID3FrameRecordingDayMonth)?.debugDescription ?? "-")
        - recordingHourMinute: \((self.frames[.RecordingHourMinute] as? ID3FrameRecordingHourMinute)?.debugDescription ?? "-")
        - genre: \((self.frames[.Genre] as? ID3FrameGenre)?.debugDescription ?? "-")
        - attachedPicture: \(ID3PictureType.allCases.reduce("", {
            $0 + " - " + ((self.frames[.AttachedPicture($1)] as? ID3FrameAttachedPicture)?.debugDescription ?? "")
        }) )
        """
    }
    
    public init(version: ID3Version, frames: [FrameName : ID3Frame]) {
        self.properties = TagProperties(version: version, size: 0)
        self.frames = frames
    }
}
