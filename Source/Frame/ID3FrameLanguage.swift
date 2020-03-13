//
//  ID3FrameLanguage.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/7/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

/**
 A class used to represent an ID3 language frame to be used in the ID3 tag.
 */
public class ID3FrameLanguage: ID3Frame, Equatable, CustomDebugStringConvertible {
    
    /// The ISO-639-2 three-letter language identifier
    private static let locale = NSLocale.autoupdatingCurrent
    #warning("I'm not sure about how to use the ISO codes enum to get the string of the language code")
    public var language = String(ISO_639_2_Codes)
    /// ID3FrameLanguage description, useful for debug.
    public var debugDescription: String {
        return "\(String(describing: language))"
    }
    
    /**
     Init a ID3 Language frame.

     - parameter language: the ISO-639-2 language code.
     */
    public init(language: ISO_639_2_Codes) {
        self.language = language.rawValue
    }

    /**
     Compare two languages.

     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.

     - returns: true if the language values are the same, else false.
     */
    public static func ==(lhs: ID3FrameLanguage, rhs: ID3FrameLanguage) -> Bool {
        return lhs.language == rhs.language
    }
}
