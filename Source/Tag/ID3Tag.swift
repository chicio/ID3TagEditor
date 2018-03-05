//
//  ID3Tag.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

public class ID3Tag {
    public var size: UInt32
    public var version: ID3Version
    public var artist: String?
    public var album: String?
    public var title: String?
    public var year: String?
    public var genre: Genre?
    public var attachedPicture: AttachedPicture?
    
    init(version: ID3Version, size: UInt32) {
        self.version = version
        self.size = size
    }
}
