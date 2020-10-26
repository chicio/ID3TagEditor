//
//  ID3UnsyncronizedLyricsFrameCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 09.10.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3UnsyncronizedLyricsFrameCreator: ID3FrameCreatorsChain {
    private let unsynchronisedLyricForLanguageFrameCreator: UnsynchronisedLyricForLanguageFrameCreator

    init(unsynchronisedLyricForLanguageFrameCreator: UnsynchronisedLyricForLanguageFrameCreator) {
        self.unsynchronisedLyricForLanguageFrameCreator = unsynchronisedLyricForLanguageFrameCreator
        super.init()
    }

    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        var frames: [UInt8] = []
        for language in ID3FrameContentLanguage.allCases {
            if let frame = id3Tag.frames[.unsynchronizedLyrics(language)],
                let unsyncronizedLyrics = frame as? ID3FrameWithLocalizedContent {
                let frame = unsynchronisedLyricForLanguageFrameCreator.createFrame(using: unsyncronizedLyrics,
                                                                                   version: id3Tag.properties.version)
                frames.append(contentsOf: frame)
            }
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag + frames)
    }
}
