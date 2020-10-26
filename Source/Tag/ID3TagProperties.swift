//
//  ID3TagProperties.swift
//
//  Created by Fabrizio Duroni on 13/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A struct that describes the properties of a tag.
 */
public struct ID3TagProperties {
    /// The size of the tag.
    var size: UInt32
    /// The version of the tag (see `ID3Version`).
    public var version: ID3Version

    init(version: ID3Version) {
        self.version = version
        self.size = 0
    }

    init(version: ID3Version, size: UInt32) {
        self.version = version
        self.size = size
    }
}
