//
//  ID3FrameUnsynchronisedLyrics.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 09.10.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

public class ID3FrameUnsynchronisedLyrics: ID3FrameWithStringContent, CustomDebugStringConvertible {
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

    public init(language: ID3FrameContentLanguage, contentDescription: String, content: String) {
        self.language = language
        self.contentDescription = contentDescription
        super.init(content: content)
    }
}
