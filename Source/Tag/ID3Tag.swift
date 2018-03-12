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
    /// The size of the tag.
    var size: UInt32
    /// The version of the tag (see `ID3Version`).
    public var version: ID3Version
    /// The artist of the tag.
    public var artist: String?
    /// The album of the tag.
    public var album: String?
    /// The title of the tag.
    public var title: String?
    /// The year of the tag.
    public var year: String?
    /// The genre of the tag (see `Genre`).
    public var genre: Genre?
    /// The attached picture of the tag (see `AttachedPicture`).
    public lazy var attachedPictures: [AttachedPicture]? = {
        return []
    }()
    /// The position of the track in the original media (see `TrackPositionInSet`).
    public var trackPosition: TrackPositionInSet?

    /**
     Init a tag.

     - parameter version: the version of the tag.
     - parameter artist: the artist of the tag.
     - parameter album: the album of the tag.
     - parameter title: the title of tag.
     - parameter year: the year of the tag.
     - parameter genre: the genre of the tag.
     - parameter attachedPictures: an array of attached picture of the tag.
     */
    public init(version: ID3Version,
                artist: String?,
                album: String?,
                title: String?,
                year: String?,
                genre: Genre?,
                attachedPictures: [AttachedPicture]?,
                trackPosition: TrackPositionInSet?) {
        self.size = 0
        self.version = version
        self.artist = artist
        self.album = album
        self.title = title
        self.year = year
        self.genre = genre
        self.attachedPictures = attachedPictures
        self.trackPosition = trackPosition
    }

    init(version: ID3Version, size: UInt32) {
        self.version = version
        self.size = size
    }
}
