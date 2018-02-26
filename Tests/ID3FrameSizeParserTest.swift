//
//  ID3FrameContentSizeParserTest.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3FrameSizeParserTest: XCTestCase {
    let id3FrameSizeParser = ID3FrameSizeParser(
            frameContentSizeParser: ID3FrameContentSizeParser(id3FrameConfiguration: ID3FrameConfiguration()),
            id3FrameConfiguration: ID3FrameConfiguration()
    )

    func testParseFrameContentSizeV2() {
        let mp3 = NSData(contentsOfFile: PathLoader().pathFor(name: "example", fileType: "mp3"))!
        XCTAssertEqual(
                id3FrameSizeParser.parse(mp3: mp3, framePosition: ID3TagConfiguration().headerSize(), version: 2),
                32003
        )
    }

    func testParseFrameContentSizeV3() {
        let mp3 = NSData(contentsOfFile: PathLoader().pathFor(name: "example-v23-png", fileType: "mp3"))!
        XCTAssertEqual(
                id3FrameSizeParser.parse(mp3: mp3, framePosition: ID3TagConfiguration().headerSize(), version: 3),
                23
        )
    }
}
