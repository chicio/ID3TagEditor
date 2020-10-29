//
//  ID3iTunesMovementIndexFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3iTunesMovementIndexFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoMovementIndex() {
        let id3MovementIndexFrameCreator = ID3iTunesMovementIndexFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .iTunesMovementIndex
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3MovementIndexFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsAMovementIndex() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.iTunesMovementIndex: ID3FrameWithIntegerContent(value: 6)]
        )
        let id3MovementIndexFrameCreator = ID3iTunesMovementIndexFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .iTunesMovementIndex
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3MovementIndexFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAMovementIndex", testFrameCreationWhenThereIsAMovementIndex),
        ("testNoFrameCreationWhenThereIsNoMovementIndex", testNoFrameCreationWhenThereIsNoMovementIndex)
    ]
}
