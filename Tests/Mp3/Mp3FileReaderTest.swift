//
//  Mp3FileReaderTest.swift
//
//  Created by Fabrizio Duroni on 19/07/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class Mp3FileReaderTest: XCTestCase {
    func testNotAnMP3FileWhenReadingEntireFile() {
        let path = PathLoader().pathFor(name: "example-cover", fileType: "jpg")
        let mp3FileReader = Mp3FileReader(tagSizeParser: ID3TagSizeParser(),
                                          id3TagConfiguration: ID3TagConfiguration())

        XCTAssertThrowsError(try mp3FileReader.readFileFrom(path: path))
    }

    func testMP3FileWhenReadingEntireFile() {
        let path = PathLoader().pathFor(name: "example", fileType: "mp3")
        let mp3FileReader = Mp3FileReader(tagSizeParser: ID3TagSizeParser(),
                                          id3TagConfiguration: ID3TagConfiguration())

        XCTAssertNoThrow(try mp3FileReader.readFileFrom(path: path))
    }

    func testNotAnMP3fileWhenReadingID3Header() {
        let path = PathLoader().pathFor(name: "example-cover", fileType: "jpg")
        let mp3FileReader = Mp3FileReader(tagSizeParser: ID3TagSizeParser(),
                                          id3TagConfiguration: ID3TagConfiguration())

        XCTAssertThrowsError(try mp3FileReader.readID3HeaderFrom(path: path))
    }

    func testMP3fileWhenReadingID3Header() {
        let path = PathLoader().pathFor(name: "example", fileType: "mp3")
        let mp3FileReader = Mp3FileReader(tagSizeParser: ID3TagSizeParser(),
                                          id3TagConfiguration: ID3TagConfiguration())

        XCTAssertNoThrow(try mp3FileReader.readID3HeaderFrom(path: path))
    }

    func testNonExistentMP3fileWhenReadingID3Header() {
        let path = "/non-existent.mp3"
        let mp3FileReader = Mp3FileReader(tagSizeParser: ID3TagSizeParser(),
                                          id3TagConfiguration: ID3TagConfiguration())

        XCTAssertThrowsError(try mp3FileReader.readID3HeaderFrom(path: path))
    }

    func testOnlyReadsID3Header() throws {
        let path = PathLoader().pathFor(name: "example", fileType: "mp3")
        let mp3FileReader = Mp3FileReader(tagSizeParser: ID3TagSizeParser(),
                                          id3TagConfiguration: ID3TagConfiguration())

        let id3HeaderData = try mp3FileReader.readID3HeaderFrom(path: path)

        // 10 bytes header + 34213 bytes according to the Tag Size in the file's ID3 header
        XCTAssertEqual(id3HeaderData.count, 10 + 34213)
    }

    static let allTests = [
        ("testNotAnMP3FileWhenReadingEntireFile", testNotAnMP3FileWhenReadingEntireFile),
        ("testMP3FileWhenReadingEntireFile", testMP3FileWhenReadingEntireFile),
        ("testNotAnMP3fileWhenReadingID3Header", testNotAnMP3fileWhenReadingID3Header),
        ("testMP3fileWhenReadingID3Header", testMP3fileWhenReadingID3Header),
        ("testNonExistentMP3fileWhenReadingID3Header", testNonExistentMP3fileWhenReadingID3Header),
        ("testOnlyReadsID3Header", testOnlyReadsID3Header)
    ]
}
