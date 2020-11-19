//
//  ID3FrameContentSizeParserTest.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3FrameContentSizeParserTest: XCTestCase {
    let id3FrameContentSizeParser = ID3FrameContentSizeParser(
        id3FrameConfiguration: ID3FrameConfiguration(),
        synchsafeIntegerDecoder: SynchsafeIntegerDecoder()
    )

    func testParseFrameContentSizeV2() {
        let mp3 = NSData(contentsOfFile: PathLoader().pathFor(name: "example", fileType: "mp3"))!
        XCTAssertEqual(
            id3FrameContentSizeParser.parse(
                    mp3: mp3,
                    framePosition: ID3TagConfiguration().headerSize(),
                    version: .version2
            ),
            31
        )
    }

    func testParseFrameContentSizeV3() {
        let mp3 = NSData(contentsOfFile: PathLoader().pathFor(name: "example-v23-png", fileType: "mp3"))!
        XCTAssertEqual(
            id3FrameContentSizeParser.parse(
                    mp3: mp3,
                    framePosition: ID3TagConfiguration().headerSize(),
                    version: .version3
            ),
            13
        )
    }

    func testParseFrameContentSizeV4() {
        let mp3 = NSData(contentsOfFile: PathLoader().pathFor(name: "example-v4-png", fileType: "mp3"))!
        XCTAssertEqual(
            id3FrameContentSizeParser.parse(
                mp3: mp3,
                framePosition: ID3TagConfiguration().headerSize(),
                version: .version4
            ),
            14
        )
    }

    static let allTests = [
        ("testParseFrameContentSizeV2", testParseFrameContentSizeV2),
        ("testParseFrameContentSizeV3", testParseFrameContentSizeV3),
        ("testParseFrameContentSizeV4", testParseFrameContentSizeV4)
    ]
}
