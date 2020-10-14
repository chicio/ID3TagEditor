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
    private let frameHeaderCreator: FrameHeaderCreator
    private let paddingAdder: PaddingAdder

    init(id3FrameConfiguration: ID3FrameConfiguration,
         frameHeaderCreator: FrameHeaderCreator,
         paddingAdder: PaddingAdder
    ) {
        self.id3FrameConfiguration = id3FrameConfiguration
        self.frameHeaderCreator = frameHeaderCreator
        self.paddingAdder = paddingAdder
    }

    func createFrame(using unsynchronisedLyric: ID3FrameUnsynchronisedLyrics, id3Tag: ID3Tag) -> [UInt8] {
        let frameBody = createFrameBodyUsing(unsynchronisedLyric: unsynchronisedLyric,  id3Tag: id3Tag)
        return frameHeaderCreator.createUsing(version: id3Tag.properties.version, frameType: .UnsyncronisedLyrics, frameBody: frameBody) + frameBody
    }
    
    private func createFrameBodyUsing(unsynchronisedLyric: ID3FrameUnsynchronisedLyrics, id3Tag: ID3Tag) -> [UInt8] {
        return id3FrameConfiguration.encodingByteFor(version: id3Tag.properties.version, encoding: .UTF16)
            + [UInt8](unsynchronisedLyric.language.rawValue.data(using: .utf8)!)
            + createFrameTextContentFrom(unsynchronisedLyric: unsynchronisedLyric)
    }
    
    private func createFrameTextContentFrom(unsynchronisedLyric: ID3FrameUnsynchronisedLyrics) -> [UInt8] {
        return paddingAdder.addTo(content:[UInt8](unsynchronisedLyric.contentDescription.data(using: .utf16)!), numberOfByte: 2)
            + unsynchronisedLyric.content.data(using: .utf16)!
    }
}
