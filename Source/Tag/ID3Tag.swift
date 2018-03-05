//
//  ID3Tag.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

public struct Artwork {
    public var art: Data;
    public var isPNG: Bool;

    public init(art: Data, isPNG: Bool) {
        self.art = art
        self.isPNG = isPNG
    }
}

public struct Genre {
    public var genre: ID3Genre?
    public var description: String?
    
    public init(genre: ID3Genre?, description: String?) {
        self.genre = genre
        self.description = description
    }
}

class ID3Tag {
    var version: ID3Version
    var size: UInt32
    var artist: String?
    var album: String?
    var title: String?
    var year: String?
    var genre: Genre?
    var artwork: Artwork?
    
    init(version: ID3Version, size: UInt32) {
        self.version = version
        self.size = size
    }
}
