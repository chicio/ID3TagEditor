//
//  ID3FrameComment.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/5/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

/**
 A class used to represent an ID3 comment or lyrics frame to be used in the ID3 tag.
 */
public class ID3FrameCommentLyrics: ID3Frame, Equatable, CustomDebugStringConvertible {
    
    /// The ISO-639-2 three-letter language identifier
    private static let locale = NSLocale.autoupdatingCurrent
    public var language: String?
    /// A short description of the frame content.
    public var contentDescription: String?
    /// the content of the frame
    public var contentText: String
    /// ID3FrameCommentLyrics description, useful for debug.
    public var debugDescription: String {
        return "\(String(describing: language)) - \(String(describing: contentDescription)) - \(String(describing: contentText)))"
    }
    
    /**
     Init a ID3 comment or lyrics frame.

     - parameter language: the ISO-639-2 language code.
     - parameter contentDescription: a terminated text string describing the frame content
     - parameter contentText: the full text of the comment or lyric frame.
     */
    public init(language: String?, contentDescription: String?, contentText: String) {
        self.language = ID3FrameCommentLyrics.locale.localizedString(forLanguageCode: language ?? "English")
        self.contentDescription = contentDescription
        self.contentText = contentText
    }

    /**
     Compare two Comment or Language frames.

     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.

     - returns: true if the language and content description values are the same, else false.
     */
    public static func ==(lhs: ID3FrameCommentLyrics, rhs: ID3FrameCommentLyrics) -> Bool {
        return lhs.contentDescription == rhs.contentDescription && lhs.language == rhs.language
    }
}
