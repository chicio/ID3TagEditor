//
//  ID3TitleFrameCreatorTest.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3TitleFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoTitle() {
        let id3TitleFrameCreator = ID3TitleFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .title
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3TitleFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsATitle() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID32v3TagBuilder()
            .title(frame: ID3FrameWithStringContent(content: "::an example title::"))
            .build()

        let id3TitleFrameCreator = ID3TitleFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .title
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3TitleFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsATitle", testFrameCreationWhenThereIsATitle),
        ("testNoFrameCreationWhenThereIsNoTitle", testNoFrameCreationWhenThereIsNoTitle)
    ]
}
