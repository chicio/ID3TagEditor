//
//  ID3AlbumArtistFrameCreatorTest.swift
//
//  Created by Fabrizio Duroni on 27/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3AlbumArtistFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoAlbumArtist() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3AlbumArtistFrameCreator = ID3AlbumArtistFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .albumArtist
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3AlbumArtistFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build(),
            tag: tagBytes
        )

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsAnAlbumArtist() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID32v3TagBuilder()
            .albumArtist(frame: ID3FrameWithStringContent(content: "::an example album artist::"))
            .build()
        let id3AlbumArtistFrameCreator = ID3AlbumArtistFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .albumArtist
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3AlbumArtistFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAnAlbumArtist", testFrameCreationWhenThereIsAnAlbumArtist),
        ("testNoFrameCreationWhenThereIsNoAlbumArtist", testNoFrameCreationWhenThereIsNoAlbumArtist)
    ]
}
