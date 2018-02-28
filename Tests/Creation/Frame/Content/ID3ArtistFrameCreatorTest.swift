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
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3ArtistFrameCreator = ID3ArtistFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameIdentifierToBeChecked: "artist"
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3ArtistFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, size: 0), tag: tagBytes)

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsAnArtist() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(version: .version3, size: 0)
        id3Tag.artist = "::an example artist::"
        let id3ArtistFrameCreator = ID3ArtistFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameIdentifierToBeChecked: "artist"
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3ArtistFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}