//
//  ID3ArtistFrameCreatorTest.swift
//
//  Created by Fabrizio Duroni on 27/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3ArtistFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoArtist() {
        let id3ArtistFrameCreator = ID3ArtistFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .artist
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3ArtistFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsAnArtist() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID32v3TagBuilder()
            .artist(frame: ID3FrameWithStringContent(content: "::an example artist::"))
            .build()
        let id3ArtistFrameCreator = ID3ArtistFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .artist
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3ArtistFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAnArtist", testFrameCreationWhenThereIsAnArtist),
        ("testNoFrameCreationWhenThereIsNoArtist", testNoFrameCreationWhenThereIsNoArtist)
    ]
}
