//
//  ID3SubtitleFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3SubtitleFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoSubtitle() {
        let id3SubtitleFrameCreator = ID3SubtitleFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .subtitle
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3SubtitleFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsASubtitle() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.subtitle: ID3FrameWithStringContent(content: "::an example subtitle::")]
        )
        let id3SubtitleFrameCreator = ID3SubtitleFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .subtitle
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3SubtitleFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsASubtitle", testFrameCreationWhenThereIsASubtitle),
        ("testNoFrameCreationWhenThereIsNoSubtitle", testNoFrameCreationWhenThereIsNoSubtitle)
    ]
}
