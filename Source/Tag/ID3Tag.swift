//
//  ID3Tag.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

struct Artwork {
    var art: Data?;
    var isPNG: Bool?;
}

public struct Genre {
    var genre: ID3Genre?
    var description: String?
}

class ID3Tag {
    var version: ID3Version
    var size: UInt32
    var artist: String?
    var album: String?
    var title: String?
    var year: String?
    var genre: Genre?
    var artwork: Artwork = Artwork()
    
    init(version: ID3Version, size: UInt32) {
        self.version = version
        self.size = size
    }
}
