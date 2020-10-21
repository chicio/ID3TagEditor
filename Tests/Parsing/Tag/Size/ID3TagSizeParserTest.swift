//
//  ID3TagSizeParserTest.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3TagSizeParserTest: XCTestCase {
    private let id3TagSizeParser = ID3TagSizeParser()

    func testParseTagSizeV2() {
        let mp3 = NSData(contentsOfFile: PathLoader().pathFor(name: "example", fileType: "mp3"))!
        XCTAssertEqual(id3TagSizeParser.parse(data: mp3), 34213)
    }

    func testParseTagSizeV3() {
        let mp3V23 = NSData(contentsOfFile: PathLoader().pathFor(name: "example-v23", fileType: "mp3"))!
        XCTAssertEqual(id3TagSizeParser.parse(data: mp3V23), 245864)
    }

    static let allTests = [
        ("testParseTagSizeV2", testParseTagSizeV2),
        ("testParseFrameContentSizeV3", testParseTagSizeV3)
    ]
}
