//
//  ID3GenreStringAdapterTest.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

@Suite struct ID3GenreStringAdapterTest {
    @Test func testAdaptGenreWithDescription() {
        let genre = ID3GenreStringAdapter().adapt(genre: "(9)Metalcore")

        #expect(genre.identifier == .metal)
        #expect(genre.description == "Metalcore")
    }

    @Test func testAdaptGenreWithoutDescription() {
        let genre = ID3GenreStringAdapter().adapt(genre: "(9)")

        #expect(genre.identifier == .metal)
        #expect(genre.description == nil)
    }

    @Test func testAdaptGenreWithoutGenreIdentifier() {
        let genre = ID3GenreStringAdapter().adapt(genre: "Rock & Roll")

        #expect(genre.identifier == nil)
        #expect(genre.description == "Rock & Roll")
    }

    @Test func testAdaptID3v3NewGenresNotNumeric() {
        #expect(ID3GenreStringAdapter().adapt(genre: "(RX)").identifier == .remix)
        #expect(ID3GenreStringAdapter().adapt(genre: "(CR)").identifier == .cover)
        #expect(ID3GenreStringAdapter().adapt(genre: "(XXX)").identifier == nil)
        #expect(ID3GenreStringAdapter().adapt(genre: "(XXX)").description == "(XXX)")
    }
}
