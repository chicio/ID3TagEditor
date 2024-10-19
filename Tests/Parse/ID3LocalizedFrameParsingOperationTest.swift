////
////  ID3LocalizedFrameParsingOperationTest.swift
////  ID3TagEditor
////
////  Created by Fabrizio Duroni on 14/10/20.
////  2020 Fabrizio Duroni.
////

import Foundation
import Testing

@testable import ID3TagEditor

struct ID3LocalizedFrameParsingOperationTest {
    @Test func testParsingValidFrame() async {
        let lyricsOperation = ID3LocalizedFrameContentParsingOperationFactory.make(
            frameName: FrameName.unsynchronizedLyrics
        )

        await confirmation("unsynchronised lyrics") { fulfill in
            lyricsOperation.parse(frame: frameV3Valid(), version: .version3) { (_, frame) in
                #expect((frame as? ID3FrameWithLocalizedContent)?.content == "c")
                #expect((frame as? ID3FrameWithLocalizedContent)?.contentDescription == "cd")
                #expect((frame as? ID3FrameWithLocalizedContent)?.language == .ita)
                fulfill()
            }
        }
    }

    @Test func testParsingInvalidLanguage() async {
        let lyricsOperation = ID3LocalizedFrameContentParsingOperationFactory.make(
            frameName: FrameName.unsynchronizedLyrics
        )

        await confirmation("unsynchronised lyrics") { fulfill in
            lyricsOperation.parse(frame: frameV3InvalidLanguage(), version: .version3) { (_, frame) in
                #expect((frame as? ID3FrameWithLocalizedContent)?.content == "c")
                #expect((frame as? ID3FrameWithLocalizedContent)?.contentDescription == "cd")
                #expect((frame as? ID3FrameWithLocalizedContent)?.language == .unknown)
                fulfill()
            }
        }
    }

    private func frameV3Valid() -> Data {
        let separator = Data([0x00, 0x00])
        let content = "cd".data(using: .utf16)!
            + separator
            + "c".data(using: .utf16)!
        return Data(
                [UInt8]("USTL".utf8)
                + [0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
                + [ID3StringEncoding.UTF16.rawValue]
                + [UInt8]("ita".utf8)
                + content
        )
    }

    private func frameV3InvalidLanguage() -> Data {
        let separator = Data([0x00, 0x00])
        let content = "cd".data(using: .utf16)!
            + separator
            + "c".data(using: .utf16)!
        return Data(
                [UInt8]("USTL".utf8)
                + [0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
                + [ID3StringEncoding.UTF16.rawValue]
                + [UInt8]("abc".utf8)
                + content
        )
    }
}
