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
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3AlbumFrameCreator = ID3AlbumFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .album
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3AlbumFrameCreator.createFrames(
            id3Tag: ID3Tag(version: .version3, frames: [:]),
            tag: tagBytes
        )

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsAnAlbum() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.album: ID3FrameWithStringContent(content: "::an example album::")]
        )
        let id3AlbumFrameCreator = ID3AlbumFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .album
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3AlbumFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAnAlbum", testFrameCreationWhenThereIsAnAlbum),
        ("testNoFrameCreationWhenThereIsNoAlbum", testNoFrameCreationWhenThereIsNoAlbum)
    ]
}
