//
//  ID3FrameUserDefinedText.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/13/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

/**
 A class used to represent an ID3 comment or lyrics frame to be used in the ID3 tag.
 */
public class ID3FrameUserDefinedText: ID3Frame, Equatable, CustomDebugStringConvertible {
    
    /// A short description of the frame content.
    public var description: String?
    /// the content of the frame
    public var content: String
    /// ID3FrameCommentLyrics description, useful for debug.
    public var debugDescription: String {
        return "\(String(describing: description)) - \(String(describing: content)))"
    }
    
    /**
     Init a ID3 comment or lyrics frame.

     - parameter language: the ISO-639-2 language code.
     - parameter contentDescription: a terminated text string describing the frame content
     - parameter contentText: the full text of the comment or lyric frame.
     */
    public init(language: ISO_639_2_Codes, description: String?, content: String) {
        self.description = description
        self.content = content
    }

    /**
     Compare two Comment or Language frames.

     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.

     - returns: true if the language and content description values are the same, else false.
     */
    public static func ==(lhs: ID3FrameUserDefinedText, rhs: ID3FrameUserDefinedText) -> Bool {
        return lhs.description == rhs.description
    }
}
