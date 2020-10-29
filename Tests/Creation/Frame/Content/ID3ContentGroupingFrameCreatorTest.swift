//
//  ID3ContentGroupingFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3ContentGroupingFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoContentGrouping() {
        let id3ContentGroupingFrameCreator = ID3ContentGroupingFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .contentGrouping
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3ContentGroupingFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsAContentGrouping() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID32v3TagBuilder()
            .contentGrouping(frame: ID3FrameWithStringContent(content: "::an example content grouping::"))
            .build()

        let id3ContentGroupingFrameCreator = ID3ContentGroupingFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .contentGrouping
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3ContentGroupingFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAContentGrouping", testFrameCreationWhenThereIsAContentGrouping),
        ("testNoFrameCreationWhenThereIsNoContentGrouping", testNoFrameCreationWhenThereIsNoContentGrouping)
    ]
}
