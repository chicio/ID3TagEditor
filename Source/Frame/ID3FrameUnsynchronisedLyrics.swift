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
    
    public init(language: ID3FrameContentLanguage, content: String) {
        self.language = language
        super.init(content: content)
    }
}
