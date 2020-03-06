//
//  ID3FrameComment.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/5/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

/**
 A class used to represent an ID3 genre frame to be used in the ID3 tag.
 */
public class ID3FrameCommentLyrics: ID3Frame, Equatable, CustomDebugStringConvertible {
    
    /// The ISO-639-2 three-letter language identifier
    public var language: ID3Language?
    /// A short description of the frame content.
    public var contentDescription: String?
    /// the content of the frame
    public var contentText: String
    /// ID3FrameGenre description, useful for debug.
    public var debugDescription: String {
        return "\(String(describing: language)) - \(String(describing: contentDescription)) - \(String(describing: contentText)))"
    }
    
    /**
     Init a ID3 genre frame.

     - parameter language: the ISO-639-2 language code.
     - parameter contentDescription: a terminated text string describing the frame content
     - parameter contentText: the full text of the comment or lyric frame.
     */
    public init(language: ID3Language?, contentDescription: String?, contentText: String) {
        self.language = language
        self.contentDescription = contentDescription
        self.contentText = contentText
    }

    /**
     Compare two Genre.

     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.

     - returns: true if the language and content description values are the same, else false.
     */
    public static func ==(lhs: ID3FrameComment, rhs: ID3FrameComment) -> Bool {
        return lhs.contentDescription == rhs.contentDescription && lhs.language == rhs.language
    }
}
