//
//  GenreFrameContentParsingOperationTest.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class GenreFrameContentParsingOperationTest: XCTestCase {
    private let value = Genre(genre: .Metal, description: "Metalcore")

    func testSetTagGenre() {
        let tag = ID3Tag(version: .version3, size: 10)
        let genreFrameContentParsingOperation = GenreFrameContentParsingOperation(
                stringContentParsingOperation: MockFrameContentParsingOperation(returnValue: "(9)Metalcore"),
                genreStringAdapter: MockGenreStringAdapter()
        )

        genreFrameContentParsingOperation.parse(frame: Data(), id3Tag: tag)

        XCTAssert(tag.genre!.identifier == value.identifier)
        XCTAssert(tag.genre!.description == value.description)
    }
}
