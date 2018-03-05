//
//  Genre.swift
//
//  Created by Fabrizio Duroni on 05/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A class used to represent a genre to be used in the ID3 tag.
 */
public struct Genre {
    /// The genre specified as an ID3 v1 Genre (see ID3Genre).
    public var genre: ID3Genre?
    /// A generic genre description. Useful to build your own genres.
    public var description: String?

    /**
     Init a genre.as

     - parameter genre: an ID3Genre to be setted in the ID3 tag.
     - parameter description: a generic genre description. Useful to build your own genres.
     */
    public init(genre: ID3Genre?, description: String?) {
        self.genre = genre
        self.description = description
    }
}
