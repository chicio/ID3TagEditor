//
//  ID3iTunesMovementCountFrameCreatorTest.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/2/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import XCTest
@testable import ID3TagEditor

class ID3iTunesMovementCountFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoMovementCount() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3MovementCountFrameCreator = ID3iTunesMovementCountFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .iTunesMovementCount
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3MovementCountFrameCreator.createFrames(
            id3Tag: ID3Tag(version: .version3, frames: [:]),
            tag: tagBytes
        )

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsAMovementCount() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.iTunesMovementCount: ID3FrameWithIntegerContent(value: 13)]
        )
        let id3MovementCountFrameCreator = ID3iTunesMovementCountFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .iTunesMovementCount
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3MovementCountFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAMovementCount", testFrameCreationWhenThereIsAMovementCount),
        ("testNoFrameCreationWhenThereIsNoMovementCount", testNoFrameCreationWhenThereIsNoMovementCount)
    ]
}
