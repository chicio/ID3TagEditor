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
                        frameIdentifierToBeChecked: "album"
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )
        let tagBytes: [UInt8] = [1, 1, 1]
        let newTagBytes = id3AlbumFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, size: 0), tag: tagBytes)
        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsAnAlbum() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3AlbumFrameCreator = ID3AlbumFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameIdentifierToBeChecked: "album"
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(version: .version3, size: 0)
        id3Tag.album = "::an example album::"
        let newTagBytes = id3AlbumFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
