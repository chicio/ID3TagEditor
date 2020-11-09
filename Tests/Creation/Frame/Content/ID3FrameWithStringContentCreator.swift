//
//  ID3FrameWithStringContentCreator.swift
//
//  Created by Fabrizio Duroni on 09.11.20.
//  2020 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3FrameWithStringContentCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoFrameData() {
        let id3AlbumFrameCreator = ID3FrameWithStringContentCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .album
            ),
            frameName: .album,
            frameType: .album
        )

        let newTagBytes = id3AlbumFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsFrameData() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID32v3TagBuilder()
            .album(frame: ID3FrameWithStringContent(content: "::an example album::"))
            .build()
        let id3AlbumFrameCreator = ID3FrameWithStringContentCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .album
            ),
            frameName: .album,
            frameType: .album
        )

        let newTagBytes = id3AlbumFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testNoFrameCreationWhenThereIsNoFrameData", testNoFrameCreationWhenThereIsNoFrameData),
        ("testFrameCreationWhenThereIsFrameData", testFrameCreationWhenThereIsFrameData)
    ]
}
