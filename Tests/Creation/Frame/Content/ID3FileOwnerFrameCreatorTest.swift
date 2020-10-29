//
//  ID3FileOwnerFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3FileOwnerFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoFileOwner() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3FileOwnerFrameCreator = ID3FileOwnerFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .fileOwner
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3FileOwnerFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsAFileOwner() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID32v3TagBuilder()
            .fileOwner(frame: ID3FrameWithStringContent(content: "::an example file owner::"))
            .build()

        let id3FileOwnerFrameCreator = ID3FileOwnerFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .fileOwner
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3FileOwnerFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAFileOwner", testFrameCreationWhenThereIsAFileOwner),
        ("testNoFrameCreationWhenThereIsNoFileOwner", testNoFrameCreationWhenThereIsNoFileOwner)
    ]
}
