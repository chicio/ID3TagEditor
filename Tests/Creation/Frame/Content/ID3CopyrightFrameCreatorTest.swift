//
//  ID3CopyrightFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3CopyrightFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoCopyright() {
        let id3CopyrightFrameCreator = ID3CopyrightFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .copyright
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3CopyrightFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsACopyright() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID32v3TagBuilder()
            .copyright(frame: ID3FrameWithStringContent(content: "::an example copyright::"))
            .build()

        let id3CopyrightFrameCreator = ID3CopyrightFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .copyright
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3CopyrightFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsACopyright", testFrameCreationWhenThereIsACopyright),
        ("testNoFrameCreationWhenThereIsNoCopyright", testNoFrameCreationWhenThereIsNoCopyright)
    ]
}
