//
//  ID3iTunesMovementNameFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3iTunesMovementNameFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoMovementName() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3MovementNameFrameCreator = ID3iTunesMovementNameFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .iTunesMovementName
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3MovementNameFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsAMovementName() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.iTunesMovementName: ID3FrameWithStringContent(content: "::an example movement name::")]
        )
        let id3MovementNameFrameCreator = ID3iTunesMovementNameFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .iTunesMovementName
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3MovementNameFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAMovementName", testFrameCreationWhenThereIsAMovementName),
        ("testNoFrameCreationWhenThereIsNoCopyright", testNoFrameCreationWhenThereIsNoMovementName)
    ]
}
