//
//  ID3LyricistFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3LyricistFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoLyricist() {
        let id3LyricistFrameCreator = ID3LyricistFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .lyricist
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3LyricistFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsALyricist() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.lyricist: ID3FrameWithStringContent(content: "::an example lyricist::")]
        )
        let id3LyricistFrameCreator = ID3LyricistFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .lyricist
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3LyricistFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsALyricist", testFrameCreationWhenThereIsALyricist),
        ("testNoFrameCreationWhenThereIsNoLyricist", testNoFrameCreationWhenThereIsNoLyricist)
    ]
}
