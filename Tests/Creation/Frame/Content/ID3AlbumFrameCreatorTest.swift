//
//  ID3AlbumFrameCreatorTest.swift
//
//  Created by Fabrizio Duroni on 27/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3AlbumFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoAlbum() {
        let id3AlbumFrameCreator = ID3AlbumFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .album
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3AlbumFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsAnAlbum() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID32v3TagBuilder()
            .album(frame: ID3FrameWithStringContent(content: "::an example album::"))
            .build()
        let id3AlbumFrameCreator = ID3AlbumFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .album
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3AlbumFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAnAlbum", testFrameCreationWhenThereIsAnAlbum),
        ("testNoFrameCreationWhenThereIsNoAlbum", testNoFrameCreationWhenThereIsNoAlbum)
    ]
}
