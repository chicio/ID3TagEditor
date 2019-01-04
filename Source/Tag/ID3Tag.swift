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
    /// Additional information about the artist of the song that contains the tag.
    public var albumArtist: String?
    /// The title of the song related to this tag.
    public var title: String?
    /// The position of the track in the original media (see `TrackPositionInSet`).
    public var trackPosition: ID3FrameTrackPosition?
    /// The album of the tag.
    public var album: String?
    ///The recording datetime of the song related to this tag.
    public lazy var recordingDateTime: RecordingDateTime? = {
        return RecordingDateTime(
            date: RecordingDate(day: nil, month: nil, year: nil),
            time: RecordingTime(hour: nil, minute: nil)
        )
    }()
    /// The genre of the recording contained in the tag (see `Genre`).
    public var genre: ID3FrameGenre?
    /// The attached picture related to the audio file contained in the tag (see `AttachedPicture`).
    public lazy var attachedPictures: [ID3FrameAttachedPicture]? = {
        return []
    }()
    /// ID3Tag description, useful for debug.
    public var debugDescription: String {
        return """
        ID3Tag:
          - size: \(self.properties.size)
          - version: \(self.properties.version)
          - artist: \((self.frames[.Artist] as? ID3FrameWithStringContent)?.content ?? "-")
          - albumArtist: \(self.albumArtist ?? "-")
          - title: \(self.title ?? "-")
          - trackPosition: \(self.trackPosition?.debugDescription ?? "-")
          - album: \(self.album ?? "-")
          - recordingDateTime: \(self.recordingDateTime?.debugDescription ?? "-")
        - genre: \(String(describing: genre))
        - attachedPicture: \(attachedPictures?.reduce("", { $0 + " - " + $1.description }) ?? "")
        """
    }
    
    public init(version: ID3Version, frames: [FrameName : ID3Frame]) {
        self.properties = TagProperties(version: version, size: 0)
        self.frames = frames
    }

    /**
     Init a tag.

     - parameter version: the version of the tag.
     - parameter artist: the artist of the tag.
     - parameter album: the album of the tag.
     - parameter title: the title of tag.
     - parameter recordingDateTime: the recording time of the tag.
     - parameter genre: the genre of the tag.
     - parameter attachedPictures: an array of attached picture of the tag.
     - parameter trackPosition: track position of the tag.
     */
    public init(version: ID3Version,
                frames: [FrameName : ID3Frame],
                albumArtist: String?,
                album: String?,
                title: String?,
                recordingDateTime: RecordingDateTime?,
                genre: ID3FrameGenre?,
                attachedPictures: [ID3FrameAttachedPicture]?,
                trackPosition: ID3FrameTrackPosition?) {
        self.properties = TagProperties(version: version, size: 0)
        self.frames = frames
        self.albumArtist = albumArtist
        self.album = album
        self.title = title
        self.recordingDateTime = recordingDateTime
        self.genre = genre
        self.attachedPictures = attachedPictures
        self.trackPosition = trackPosition
    }

    init(version: ID3Version, size: UInt32) {
        self.properties = TagProperties(version: version, size: size)
    }
}
