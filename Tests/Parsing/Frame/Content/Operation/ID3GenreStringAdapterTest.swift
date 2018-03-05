//
//  ID3GenreStringAdapterTest.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3GenreStringAdapterTest: XCTestCase {
    private let id3GenreStringAdapter = ID3GenreStringAdapter()

    func testAdaptGenreWithDescription() {
        let genre = id3GenreStringAdapter.adapt(genre: "(9)Metalcore")

        XCTAssert(genre.identifier == .Metal)
        XCTAssertEqual(genre.description, "Metalcore")
    }

    func testAdaptGenreWithoutDescription() {
        let genre = id3GenreStringAdapter.adapt(genre: "(9)")

        XCTAssert(genre.identifier == .Metal)
        XCTAssertNil(genre.description)
    }

    func testAdaptGenreWithoutGenreIdentifier() {
        let genre = id3GenreStringAdapter.adapt(genre: "Rock & Roll")

        XCTAssertNil(genre.identifier)
        XCTAssertEqual(genre.description, "Rock & Roll")
    }
}
