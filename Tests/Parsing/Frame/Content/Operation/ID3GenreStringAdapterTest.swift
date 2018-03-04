//
//  ID3GenreStringAdapterTest.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3GenreStringAdapterTest: XCTestCase {
    func testAdaptGenreWithDescription() {
        let id3GenreStringAdapter = ID3GenreStringAdapter()

        let genre = id3GenreStringAdapter.adapt(genre: "(9)Metalcore")

        XCTAssert(genre.genre == .Metal)
        XCTAssert(genre.description == "Metalcore")
    }
}

class ID3GenreStringAdapter: GenreStringAdapter {
    func adapt(genre: String) -> Genre {
        do {
            let expression = try NSRegularExpression(pattern: "(\\()\\d+(\\))")
            guard let genreWithParenthesisRange = Range(expression.rangeOfFirstMatch(in: genre, options: [], range: NSMakeRange(0, genre.count)), in: genre) else {
                return Genre(genre: nil, description: genre)
            }
            let genreWithParenthesis = genre[genreWithParenthesisRange]
            let genreDescription = genre[genreWithParenthesisRange.upperBound..<genre.endIndex]
            print(genreWithParenthesis)
            print(genreDescription)
        } catch {
            return Genre(genre: nil, description: genre)
        }
    }
}