//
//  ID3iTunesGroupingFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3iTunesGroupingFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoGrouping() {
        let id3iTunesGroupingFrameCreator = ID3iTunesGroupingFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .iTunesGrouping
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3iTunesGroupingFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsAGrouping() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.iTunesGrouping: ID3FrameWithStringContent(content: "::an example grouping::")]
        )
        let id3iTunesGroupingFrameCreator = ID3iTunesGroupingFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .iTunesGrouping
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3iTunesGroupingFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAGrouping", testFrameCreationWhenThereIsAGrouping),
        ("testNoFrameCreationWhenThereIsNoGrouping", testNoFrameCreationWhenThereIsNoGrouping)
    ]
}
