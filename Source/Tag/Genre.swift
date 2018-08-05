//
//  Genre.swift
//
//  Created by Fabrizio Duroni on 05/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A struct used to represent a genre to be used in the ID3 tag.
 */
public struct Genre: Equatable {
    /// The genre identifier specified as an ID3 v1 Genre (see ID3Genre).
    public var identifier: ID3Genre?
    /// A generic genre description. Useful to build your own genres.
    public var description: String?

    /**
     Init a genre.as

     - parameter genre: an ID3Genre to be setted in the ID3 tag.
     - parameter description: a generic genre description. Useful to build your own genres.
     */
    public init(genre: ID3Genre?, description: String?) {
        self.identifier = genre
        self.description = description
    }

    /**
     Compare two Genre.

     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.

     - returns: true if the genre values are the same, else false.
     */
    public static func ==(lhs: Genre, rhs: Genre) -> Bool {
        return lhs.description == rhs.description && lhs.identifier == rhs.identifier
    }
}
