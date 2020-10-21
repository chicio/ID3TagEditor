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
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3TitleFrameCreator = ID3TitleFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .title
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3TitleFrameCreator.createFrames(
            id3Tag: ID3Tag(version: .version3, frames: [:]),
            tag: tagBytes
        )

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsATitle() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.title: ID3FrameWithStringContent(content: "::an example title::")]
        )
        let id3TitleFrameCreator = ID3TitleFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .title
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3TitleFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsATitle", testFrameCreationWhenThereIsATitle),
        ("testNoFrameCreationWhenThereIsNoTitle", testNoFrameCreationWhenThereIsNoTitle)
    ]
}
