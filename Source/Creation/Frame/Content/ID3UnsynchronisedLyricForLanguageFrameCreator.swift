//
//  ID3UnsyncronisedLyricsFrameCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 14/10/20.
//  2020 Fabrizio Duroni.
//

import Foundation

protocol UnsynchronisedLyricForLanguageFrameCreator {
    func createFrame(using unsynchronisedLyric: ID3FrameUnsynchronisedLyrics, version: ID3Version) -> [UInt8]
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

    func createFrame(using unsynchronisedLyric: ID3FrameUnsynchronisedLyrics, version: ID3Version) -> [UInt8] {
        let frameBody = createFrameBodyUsing(unsynchronisedLyric: unsynchronisedLyric, version: version)
        let frameHeader = frameHeaderCreator.createUsing(
            version: version,
            frameType: .unsyncronisedLyrics,
            frameBody: frameBody
        )
        return frameHeader + frameBody
    }

    private func createFrameBodyUsing(unsynchronisedLyric: ID3FrameUnsynchronisedLyrics,
                                      version: ID3Version) -> [UInt8] {
        return id3FrameConfiguration.encodingByteFor(version: version, encoding: .UTF16)
            + [UInt8](unsynchronisedLyric.language.rawValue.data(using: .utf8)!)
            + createFrameTextContentFrom(unsynchronisedLyric: unsynchronisedLyric)
    }

    private func createFrameTextContentFrom(unsynchronisedLyric: ID3FrameUnsynchronisedLyrics) -> [UInt8] {
        let contentDescriptor = paddingAdder.addTo(
            content: [UInt8](unsynchronisedLyric.contentDescription.data(using: .utf16)!),
            numberOfByte: 2
        )
        let content = unsynchronisedLyric.content.data(using: .utf16)!
        return contentDescriptor + content
    }
}
