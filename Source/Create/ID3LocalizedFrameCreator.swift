//
//  ID3LocalizedFrameCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 14/10/20.
//  2020 Fabrizio Duroni.
//

import Foundation

class ID3LocalizedFrameCreator: LocalizedFrameCreator {
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

    func createFrame(using frameContent: ID3FrameWithLocalizedContent,
                     version: ID3Version,
                     frameType: FrameType) -> [UInt8] {
        let frameBody = createFrameBodyUsing(frameContent: frameContent, version: version)
        let frameHeader = frameHeaderCreator.createUsing(
            version: version,
            frameType: frameType,
            frameBody: frameBody
        )
        return frameHeader + frameBody
    }

    private func createFrameBodyUsing(frameContent: ID3FrameWithLocalizedContent,
                                      version: ID3Version) -> [UInt8] {
        return id3FrameConfiguration.encodingByteFor(version: version, encoding: .UTF16)
            + [UInt8](frameContent.language.rawValue.data(using: .utf8)!)
            + createFrameTextContentFrom(unsynchronisedLyric: frameContent)
    }

    private func createFrameTextContentFrom(unsynchronisedLyric: ID3FrameWithLocalizedContent) -> [UInt8] {
        let contentDescriptor = paddingAdder.addTo(
            content: [UInt8](unsynchronisedLyric.contentDescription.data(using: .utf16)!),
            numberOfByte: 2
        )
        let content = unsynchronisedLyric.content.data(using: .utf16)!
        return contentDescriptor + content
    }
}
