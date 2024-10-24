//
//  Mp3FileReaderTest.swift
//
//  Created by Fabrizio Duroni on 19/07/2018.
//  2018 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct Mp3FileReaderTest {
    @Test func testNotAnMP3FileWhenReadingEntireFile() {
        let path = PathLoader().pathFor(name: "example-cover", fileType: "jpg")
        let mp3FileReader = Mp3FileReaderFactory.make()

        #expect(throws: ID3TagEditorError.invalidFileFormat.self) { try mp3FileReader.readFileFrom(path: path) }
    }

    @Test func testMP3FileWhenReadingEntireFile() {
        let path = PathLoader().pathFor(name: "example", fileType: "mp3")
        let mp3FileReader = Mp3FileReaderFactory.make()

        #expect(throws: Never.self) { try mp3FileReader.readFileFrom(path: path) }
    }

    @Test func testNotAnMP3fileWhenReadingID3Tag() {
        let path = PathLoader().pathFor(name: "example-cover", fileType: "jpg")
        let mp3FileReader = Mp3FileReaderFactory.make()

        #expect(throws: ID3TagEditorError.invalidFileFormat.self) { try mp3FileReader.readID3TagFrom(path: path) }
    }

    @Test func testMP3fileWhenReadingID3Tag() {
        let path = PathLoader().pathFor(name: "example", fileType: "mp3")
        let mp3FileReader = Mp3FileReaderFactory.make()

        #expect(throws: Never.self) { try mp3FileReader.readID3TagFrom(path: path) }
    }

    @Test func testNonExistentMP3fileWhenReadingID3Tag() {
        let path = "/non-existent.mp3"
        let mp3FileReader = Mp3FileReaderFactory.make()

        #expect(throws: Error.self) { try mp3FileReader.readFileFrom(path: path) }
        #expect(throws: Error.self) { try mp3FileReader.readID3TagFrom(path: path) }
    }

    @Test func testOnlyReadsID3Tag() throws {
        let path = PathLoader().pathFor(name: "example", fileType: "mp3")
        let mp3FileReader = Mp3FileReaderFactory.make()

        let id3TagData = try #require(try mp3FileReader.readID3TagFrom(path: path))

        // 10 bytes Tag + 34213 bytes according to the Tag Size in the file's ID3 Tag
        #expect(id3TagData.count == 10 + 34213)
    }

    @Test func testIgnoresWhenMissingID3Tag() throws {
        let path = PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3")
        let mp3FileReader = Mp3FileReaderFactory.make()

        let id3TagData = try mp3FileReader.readID3TagFrom(path: path)

        // The file has no ID3 tag
        #expect(id3TagData == nil)
    }
}
