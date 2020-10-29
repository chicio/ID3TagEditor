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
        let id3AlbumArtistFrameCreator = ID3AlbumArtistFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .albumArtist
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3AlbumArtistFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsAnAlbumArtist() {
        let newFrameBytes: [UInt8] = [1, 1]
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

        let newTagBytes = id3AlbumArtistFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAnAlbumArtist", testFrameCreationWhenThereIsAnAlbumArtist),
        ("testNoFrameCreationWhenThereIsNoAlbumArtist", testNoFrameCreationWhenThereIsNoAlbumArtist)
    ]
}
