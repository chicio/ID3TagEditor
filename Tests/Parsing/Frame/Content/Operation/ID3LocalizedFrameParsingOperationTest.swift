//
//  ID3LocalizedFrameParsingOperationTest.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 14/10/20.
//  2020 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3LocalizedFrameParsingOperationTest: XCTestCase {
    func testParsingValidFrame() {
        let expectation = XCTestExpectation(description: "unsynchronised lyrics")

        let lyricsOperation = ID3LocalizedFrameContentParsingOperationFactory.make(
            frameName: FrameName.unsynchronizedLyrics
        )

        lyricsOperation.parse(frame: frameV3Valid(), version: .version3) { (_, frame) in
            XCTAssertEqual((frame as? ID3FrameWithLocalizedContent)?.content, "c")
            XCTAssertEqual((frame as? ID3FrameWithLocalizedContent)?.contentDescription, "cd")
            XCTAssertEqual((frame as? ID3FrameWithLocalizedContent)?.language, .ita)
            expectation.fulfill()
        }
    }

    func testParsingInvalidLanguage() {
        let expectation = XCTestExpectation(description: "unsynchronised lyrics")

        let lyricsOperation = ID3LocalizedFrameContentParsingOperationFactory.make(
            frameName: FrameName.unsynchronizedLyrics
        )

        lyricsOperation.parse(frame: frameV3InvalidLanguage(), version: .version3) { (_, frame) in
            XCTAssertEqual((frame as? ID3FrameWithLocalizedContent)?.content, "c")
            XCTAssertEqual((frame as? ID3FrameWithLocalizedContent)?.contentDescription, "cd")
            XCTAssertEqual((frame as? ID3FrameWithLocalizedContent)?.language, .unknown)
            expectation.fulfill()
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

    static let allTests = [
        ("testParsingValidFrame", testParsingValidFrame),
        ("testParsingInvalidLanguage", testParsingInvalidLanguage)
    ]
}
