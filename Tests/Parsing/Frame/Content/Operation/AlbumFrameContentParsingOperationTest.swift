//
//  AlbumFrameContentParsingOperationTest.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class AlbumFrameContentParsingOperationTest: XCTestCase {
    private let value = "::value::"

    func testSetTagAlbum() {
        let tag = ID3Tag(version: .version3, size: 10)
        let albumFrameContentParsingOperation = AlbumFrameContentParsingOperation(
                stringContentParsingOperation: MockFrameContentParsingOperation(returnValue: value)
        )

        albumFrameContentParsingOperation.parse(frame: Data(), id3Tag: tag)

        XCTAssertEqual(tag.album, value)
    }
}
