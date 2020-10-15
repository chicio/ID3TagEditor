//
//  ID3FrameUnsynchronisedLyrics.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 09.10.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation


public class ID3FrameUnsynchronisedLyrics: ID3FrameWithStringContent {
    public let language: ID3FrameContentLanguage
    public let contentDescription: String
    
    public init(language: ID3FrameContentLanguage, contentDescription: String, content: String) {
        self.language = language
        self.contentDescription = contentDescription
        super.init(content: content)
    }
}
