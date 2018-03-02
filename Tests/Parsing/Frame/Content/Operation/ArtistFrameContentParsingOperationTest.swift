//
//  ArtistFrameContentParsingOperationTest.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ArtistFrameContentParsingOperationTest: XCTestCase {
    private let value = "::value::"

    func testSetTagArtist() {
        let tag = ID3Tag(version: .version3, size: 10)
        let artistFrameContentParsingOperation = ArtistFrameContentParsingOperation(
                stringContentParsingOperation: MockFrameContentParsingOperation(returnValue: value)
        )

        artistFrameContentParsingOperation.parse(frame: Data(), id3Tag: tag)

        XCTAssertEqual(tag.artist, value)
    }
}
