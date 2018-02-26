//
//  ID3Tag.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

struct Artwork {
    var art: NSData?;
    var isPNG: Bool?;
}

class ID3Tag {
    var version: UInt8
    var size: UInt32
    var artist: String?
    var album: String?
    var title: String?
    var artwork: Artwork = Artwork()
    
    init(version: UInt8, size: UInt32) {
        self.version = version
        self.size = size
    }
}
