//
//  ID3Tag.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A class used to represent and ID3 tag.
 */
public class ID3Tag {
    public var properties: ID3TagProperties
    /// The artist of the tag.
    public var artist: String?
    /// Additional information about the artist of the song that contains the tag.
    public var albumArtist: String?
    /// The title of the song related to this tag.
    public var title: String?
    /// The position of the track in the original media (see `TrackPositionInSet`).
    public var trackPosition: TrackPositionInSet?
    /// The album of the tag.
    public var album: String?
    ///The recording datetime of the song related to this tag.
    public lazy var recordingDateTime: RecordingDateTime? = RecordingDateTime()
    /// The genre of the recording contained in the tag (see `Genre`).
    public var genre: Genre?
    /// The attached picture related to the audio file contained in the tag (see `AttachedPicture`).
    public lazy var attachedPictures: [AttachedPicture]? = {
        return []
    }()

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
                artist: String?,
                albumArtist: String?,
                album: String?,
                title: String?,
                recordingDateTime: RecordingDateTime?,
                genre: Genre?,
                attachedPictures: [AttachedPicture]?,
                trackPosition: TrackPositionInSet?) {
        self.properties = ID3TagProperties(version: version, size: 0)
        self.artist = artist
        self.albumArtist = albumArtist
        self.album = album
        self.title = title
        self.recordingDateTime = recordingDateTime
        self.genre = genre
        self.attachedPictures = attachedPictures
        self.trackPosition = trackPosition
    }

    init(version: ID3Version, size: UInt32) {
        self.properties = ID3TagProperties(version: version, size: size)
    }
}
