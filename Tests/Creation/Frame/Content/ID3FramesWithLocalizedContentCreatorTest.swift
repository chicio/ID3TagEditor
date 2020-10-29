//
//  ID3UnsyncronizedLyricsFrameCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 14/10/20.
//  2020 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3FramesWithLocalizedContentCreatorTest: XCTestCase {
    func testNothingIsCreatedWheLyricsDataIsNotSet() {
        let creator = ID3FramesWithLocalizedContentCreator(
            localizedFrameNames: frameNamesWithLocalizedContent,
            localizedFrameCreator: MockLocalizedFrameCreator()
        )

        let frame = creator.createFrames(id3Tag: ID32v3TagBuilder().build())

        XCTAssertEqual(frame, [])
    }

    func testCreateFrameForValidData() {
        let creator = ID3FramesWithLocalizedContentCreator(
            localizedFrameNames: frameNamesWithLocalizedContent,
            localizedFrameCreator: MockLocalizedFrameCreator()
        )

        let frame = creator.createFrames(id3Tag: aTagWithUnsynchronisedLyrics())

        XCTAssertEqual(frame, [0x01])
    }

    private func aTagWithUnsynchronisedLyrics() -> ID3Tag {
        return ID32v3TagBuilder()
            .unsynchronisedLyrics(language: .ita, frame: ID3FrameWithLocalizedContent(
                language: .ita,
                contentDescription: "decription",
                content: "content"
            ))
            .build()
    }

    static let allTests = [
        ("testNothingIsCreatedWheLyricsDataIsNotSet", testNothingIsCreatedWheLyricsDataIsNotSet),
        ("testCreateFrameForValidData", testCreateFrameForValidData)
    ]
}
