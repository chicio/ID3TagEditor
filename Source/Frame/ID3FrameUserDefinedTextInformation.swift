//
//  ID3FrameUserDefinedTextInformation.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 26/07/2025.
//  2025 Fabrizio Duroni.
//

import Foundation

/**
 A class used to represent an ID3 User Defined Text Information frame (TXXX in v2.3/v2.4, TXX in v2.2).
 This frame is intended for one-string text information concerning the audio file.
 The frame contains a description field that identifies the type of text and the actual text value.
 Multiple TXXX frames are allowed in a tag, but only one with the same description.
 */
public class ID3FrameUserDefinedTextInformation: ID3FrameWithStringContent, CustomDebugStringConvertible {
    /// A description that identifies the type of text information
    public let description: String
    /// ID3FrameUserDefinedTextInformation debug description.
    public var debugDescription: String {
        return """
            description: \(description)
            content: \(content)
            """
    }

    /**
     Init an ID3 User Defined Text Information frame.

     - parameter description: a description that identifies the type of text information.
     - parameter content: the actual text content.
     */
    public init(description: String, content: String) {
        self.description = description
        super.init(content: content)
    }
}