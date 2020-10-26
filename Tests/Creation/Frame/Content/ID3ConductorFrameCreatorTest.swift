//
//  ID3ConductorFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3ConductorFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoConductor() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3ConductorFrameCreator = ID3ConductorFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .conductor
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3ConductorFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build(),
            tag: tagBytes
        )

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsAConductor() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID32v3TagBuilder()
            .conductor(frame: ID3FrameWithStringContent(content: "::an example conductor::"))
            .build()
            
        let id3ConductorFrameCreator = ID3ConductorFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .conductor
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3ConductorFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAConductor", testFrameCreationWhenThereIsAConductor),
        ("testNoFrameCreationWhenThereIsNoConductor", testNoFrameCreationWhenThereIsNoConductor)
    ]
}
