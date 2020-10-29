//
//  ID3MixArtistFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3MixArtistFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoMixArtist() {
        let id3MixArtistFrameCreator = ID3MixArtistFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .mixArtist
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3MixArtistFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsAMixArtist() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.mixArtist: ID3FrameWithStringContent(content: "::an example mix artist::")]
        )
        let id3MixArtistFrameCreator = ID3MixArtistFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .mixArtist
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3MixArtistFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAMixArtist", testFrameCreationWhenThereIsAMixArtist),
        ("testNoFrameCreationWhenThereIsNoMixArtist", testNoFrameCreationWhenThereIsNoMixArtist)
    ]
}
