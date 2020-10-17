//
//  ID3FrameGenre.swift
//
//  Created by Fabrizio Duroni on 05/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A class used to represent an ID3 genre frame to be used in the ID3 tag.
 */
public class ID3FrameGenre: ID3Frame, Equatable, CustomDebugStringConvertible {
    /// The genre identifier specified as an ID3 v1 Genre (see ID3Genre).
    public var identifier: ID3Genre?
    /// A generic genre description. Useful to build your own genres.
    public var description: String?
    /// ID3FrameGenre description, useful for debug.
    public var debugDescription: String {
        return "\(String(describing: identifier)) - \(String(describing: description))"
    }

    /**
     Init a ID3 genre frame.

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
    public static func == (lhs: ID3FrameGenre, rhs: ID3FrameGenre) -> Bool {
        return lhs.description == rhs.description && lhs.identifier == rhs.identifier
    }
}
