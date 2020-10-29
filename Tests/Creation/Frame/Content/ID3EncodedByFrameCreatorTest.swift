//
//  ID3EncodedByFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3EncodedByFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoEncodedBy() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3EncodedByFrameCreator = ID3EncodedByFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .encodedBy
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3EncodedByFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsAnEncodedBy() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID32v3TagBuilder()
            .encodedBy(frame: ID3FrameWithStringContent(content: "::an example encodedBy::"))
            .build()

        let id3EncodedByFrameCreator = ID3EncodedByFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .encodedBy
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3EncodedByFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAnEncodedBy", testFrameCreationWhenThereIsAnEncodedBy),
        ("testNoFrameCreationWhenThereIsNoEncodedBy", testNoFrameCreationWhenThereIsNoEncodedBy)
    ]
}
