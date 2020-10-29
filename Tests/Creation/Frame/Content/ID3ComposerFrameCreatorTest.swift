//
//  ID3ComposerFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3ComposerFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoComposer() {
        let id3ComposerFrameCreator = ID3ComposerFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .composer
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3ComposerFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsAComposer() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID32v3TagBuilder()
            .composer(frame: ID3FrameWithStringContent(content: "::an example composer::"))
            .build()

        let id3ComposerFrameCreator = ID3ComposerFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .composer
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3ComposerFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAComposer", testFrameCreationWhenThereIsAComposer),
        ("testNoFrameCreationWhenThereIsNoComposer", testNoFrameCreationWhenThereIsNoComposer)
    ]
}
