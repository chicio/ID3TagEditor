//
//  ID3VersionParserTest.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3VersionParserTest: XCTestCase {
    let id3VersionParser = ID3TagVersionParser()
    
    func testExtractVersion2() {
        let mp3WithV2Tag = try! Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example", fileType: "mp3")))
        XCTAssertEqual(2, id3VersionParser.parse(mp3: mp3WithV2Tag))
    }
    
    func testExtractVersion3() {
        let mp3WithV2Tag = try! Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-v23", fileType: "mp3")))
        XCTAssertEqual(3, id3VersionParser.parse(mp3: mp3WithV2Tag))
    }
    
    func testDefaultVersion() {
        let mp3WithV2Tag = try! Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3")))
        XCTAssertEqual(3, id3VersionParser.parse(mp3: mp3WithV2Tag))
    }
}
