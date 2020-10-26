//
//  ID3FrameWithLocalizedContent.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 09.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

/**
 A class used to represent an ID3 frame that contains localized content to be used in the ID3 tag.
 Only a subset of the ID3 frames support localized content. See the various ID3 tag builders to
 understand which frames admit a locallized content.
 See the official id3 documentation for a full list of frame with localized content.
 */
public class ID3FrameWithLocalizedContent: ID3FrameWithStringContent, CustomDebugStringConvertible {
    /// The language of the lyrics contained in the frame
    public let language: ID3FrameContentLanguage
    /// A short description of the lyrics contained in the frame
    public let contentDescription: String
    /// ID3FrameAttachedPicture debug description.
    public var debugDescription: String {
        return """
            language: \(language)
            contentDescription: \(contentDescription)
            content: \(content)
            """
    }

    /**
     Init an ID3 localized string content frame.

     - parameter language: the language of the content. See `ID3PictureType`
     for a complete list of the available languages.
     - parameter contentDescription: a description of the content of the frame as string.
     - parameter content: the content.of the frame (see ID3FrameContentLanguage).
     types.
     */
    public init(language: ID3FrameContentLanguage, contentDescription: String, content: String) {
        self.language = language
        self.contentDescription = contentDescription
        super.init(content: content)
    }
}
