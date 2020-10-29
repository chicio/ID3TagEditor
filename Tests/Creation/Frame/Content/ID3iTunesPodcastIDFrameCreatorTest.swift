//
//  ID3iTunesPodcastIDFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3iTunesPodcastIDFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoPodcastID() {
        let id3PodcastIDFrameCreator = ID3iTunesPodcastIDFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .iTunesPodcastID
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3PodcastIDFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsAPodcastID() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.iTunesPodcastID: ID3FrameWithStringContent(content: "::an example podcast ID::")]
        )
        let id3PodcastIDFrameCreator = ID3iTunesPodcastIDFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .iTunesPodcastID
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3PodcastIDFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAPodcastID", testFrameCreationWhenThereIsAPodcastID),
        ("testNoFrameCreationWhenThereIsNoPodcastID", testNoFrameCreationWhenThereIsNoPodcastID)
    ]
}
