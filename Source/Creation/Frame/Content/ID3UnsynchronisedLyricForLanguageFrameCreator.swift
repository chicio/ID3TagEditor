//
//  ID3UnsyncronisedLyricsFrameCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 09.10.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

protocol UnsynchronisedLyricForLanguageFrameCreator {
    func createFrame(using unsynchronisedLyric: ID3FrameUnsynchronisedLyrics, id3Tag: ID3Tag) -> [UInt8]
}

class ID3UnsynchronisedLyricForLanguageFrameCreator: UnsynchronisedLyricForLanguageFrameCreator {
    private let id3FrameConfiguration: ID3FrameConfiguration
    private let frameContentSizeCalculator: FrameContentSizeCalculator
    private let frameFlagsCreator: FrameFlagsCreator
    private let paddingAdder: PaddingAdder

    init(id3FrameConfiguration: ID3FrameConfiguration,
         frameContentSizeCalculator: FrameContentSizeCalculator,
         frameFlagsCreator: FrameFlagsCreator,
         paddingAdder: PaddingAdder
    ) {
        self.id3FrameConfiguration = id3FrameConfiguration
        self.frameContentSizeCalculator = frameContentSizeCalculator
        self.frameFlagsCreator = frameFlagsCreator
        self.paddingAdder = paddingAdder
    }

    func createFrame(using unsynchronisedLyric: ID3FrameUnsynchronisedLyrics, id3Tag: ID3Tag) -> [UInt8] {
        let contentAsBytes = id3FrameConfiguration.encodingByteFor(version: id3Tag.properties.version, encoding: .UTF16)
            + [UInt8](unsynchronisedLyric.language.rawValue.data(using: .utf8)!)
            + [UInt8](repeating: 0, count: 2) // Content descriptor to default
            + paddingAdder.addTo(content:[UInt8](unsynchronisedLyric.content.data(using: .utf16)!), numberOfByte: 1)

        var frame: [UInt8] = id3FrameConfiguration.identifierFor(
                frameType: .UnsyncronisedLyrics,
                version: id3Tag.properties.version
        )
        frame.append(contentsOf: frameContentSizeCalculator.calculateSizeOf(
                content: contentAsBytes,
                version: id3Tag.properties.version
        ))
        frame.append(contentsOf: frameFlagsCreator.createFor(version: id3Tag.properties.version))
        frame.append(contentsOf: contentAsBytes)
        
        return frame
    }
}
