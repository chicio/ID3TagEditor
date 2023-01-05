//
//  Mp3FileReaderTest.swift
//
//  Created by Fabrizio Duroni on 19/07/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class Mp3FileReaderTest: XCTestCase {
    func testNotAnMp3file() {
        let path = PathLoader().pathFor(name: "example-cover", fileType: "jpg")
        let mp3FileReader = Mp3FileReader(tagSizeParser: ID3TagSizeParser(),
                                          id3TagConfiguration: ID3TagConfiguration())

        XCTAssertThrowsError(try mp3FileReader.readFileFrom(path: path))
    }

    func testMp3File() {
        let path = PathLoader().pathFor(name: "example", fileType: "mp3")
        let mp3FileReader = Mp3FileReader(tagSizeParser: ID3TagSizeParser(),
                                          id3TagConfiguration: ID3TagConfiguration())

        XCTAssertNoThrow(try mp3FileReader.readFileFrom(path: path))
    }

    static let allTests = [
        ("testNotAnMp3file", testNotAnMp3file),
        ("testMp3File", testMp3File)
    ]
}
