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
    public var properties: ID3TagProperties
    /// Dictionary that contains the frames extracted or to be added to the id3 tag for an mp3 file.
    public lazy var frames: [FrameName: ID3Frame] = {
        return [:]
    }()
    /// ID3Tag description, useful for debug.
    public var debugDescription: String {
        return ID3TagToStringAdapter().adapt(id3Tag: self)
    }

    init(version: ID3Version, frames: [FrameName: ID3Frame]) {
        self.properties = ID3TagProperties(version: version, size: 0)
        self.frames = frames
    }
}
