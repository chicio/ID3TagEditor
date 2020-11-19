//
//  ID3DiscPositionFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3DiscPositionFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoDiscPosition() {
        let id3DiscPositionFrameCreator = ID3DiscPositionFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .discPosition
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3DiscPositionFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsADiscPosition() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID32v3TagBuilder()
            .discPosition(frame: ID3FramePartOfTotal(part: 1, total: 3))
            .build()

        let id3GenreFrameCreator = ID3DiscPositionFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .discPosition
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3GenreFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsADiscPosition", testFrameCreationWhenThereIsADiscPosition),
        ("testNoFrameCreationWhenThereIsNoDiscPosition", testNoFrameCreationWhenThereIsNoDiscPosition)
    ]
}
