//
//  ID3iTunesPodcastCategoryFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3iTunesPodcastCategoryFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoPodcastCategory() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3PodcastCategoryFrameCreator = ID3iTunesPodcastCategoryFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .iTunesPodcastCategory
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3PodcastCategoryFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsAPodcastCategory() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.iTunesPodcastCategory: ID3FrameWithStringContent(content: "::an example podcast Category::")]
        )
        let id3PodcastCategoryFrameCreator = ID3iTunesPodcastCategoryFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .iTunesPodcastCategory
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3PodcastCategoryFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAPodcastCategory", testFrameCreationWhenThereIsAPodcastCategory),
        ("testNoFrameCreationWhenThereIsNoPodcastCategory", testNoFrameCreationWhenThereIsNoPodcastCategory)
    ]
}
