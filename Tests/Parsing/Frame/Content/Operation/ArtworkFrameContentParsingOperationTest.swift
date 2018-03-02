//
//  ArtworkFrameContentParsingOperationTest.swift
//
//  Created by Fabrizio Duroni on 02/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ArtworkFrameContentParsingOperationTest: XCTestCase {
    func testSetTagArtworkPng() {
        let id3Tag = ID3Tag(version: .version3, size: 10)
        let artworkFrameContentParsingOperation = ArtworkFrameContentParsingOperation(
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        artworkFrameContentParsingOperation.parse(
                frame: Data(bytes: [0x89, 0x50, 0x4E, 0x47, 0x11, 0x11]),
                id3Tag: id3Tag
        )

        XCTAssertEqual(id3Tag.artwork.isPNG, true)
        XCTAssertEqual(id3Tag.artwork.art, Data(bytes: [0x89, 0x50, 0x4E, 0x47, 0x11, 0x11]))
    }

    func testSetTagArtworkJpg() {
        let id3Tag = ID3Tag(version: .version3, size: 10)
        let artworkFrameContentParsingOperation = ArtworkFrameContentParsingOperation(
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        artworkFrameContentParsingOperation.parse(
                frame: Data(bytes: [0xFF, 0xD8, 0xFF, 0xE0, 0x11, 0x11]),
                id3Tag: id3Tag
        )

        XCTAssertEqual(id3Tag.artwork.isPNG, false)
        XCTAssertEqual(id3Tag.artwork.art, Data(bytes: [0xFF, 0xD8, 0xFF, 0xE0, 0x11, 0x11]))
    }
}
