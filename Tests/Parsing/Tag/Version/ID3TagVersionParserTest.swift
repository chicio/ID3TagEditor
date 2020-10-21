//
//  ID3TagVersionParserTest.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3TagVersionParserTest: XCTestCase {
    private let id3VersionParser = ID3TagVersionParser()

    func testExtractVersion2() throws {
        let mp3WithV2Tag = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example", fileType: "mp3"))
        )
        XCTAssertEqual(.version2, id3VersionParser.parse(mp3: mp3WithV2Tag))
    }

    func testExtractVersion3() throws {
        let mp3WithV2Tag = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-v23", fileType: "mp3"))
        )
        XCTAssertEqual(.version3, id3VersionParser.parse(mp3: mp3WithV2Tag))
    }

    func testDefaultVersion() throws {
        let mp3WithV2Tag = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"))
        )
        XCTAssertEqual(.version3, id3VersionParser.parse(mp3: mp3WithV2Tag))
    }

    static let allTests = [
        ("testExtractVersion2", testExtractVersion2),
        ("testExtractVersion3", testExtractVersion3),
        ("testDefaultVersion", testDefaultVersion)
    ]
}
