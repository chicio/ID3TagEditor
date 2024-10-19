//
//  ID3FrameContentSizeParserTest.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
import Testing

@testable import ID3TagEditor

struct ID3FrameSizeParserTest {
    @Test func testParseFrameContentSizeV2() {
        let mp3 = NSData(contentsOfFile: PathLoader().pathFor(name: "example", fileType: "mp3"))!
        let id3FrameSizeParser = ID3FrameSizeParser(
                frameContentSizeParser: MockFrameContentSizeParser(),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        #expect(
                id3FrameSizeParser.parse(
                    mp3: mp3, framePosition: ID3TagConfiguration().headerSize(),
                    version: .version2
                ) ==
                mp3.length + ID3FrameConfiguration().headerSizeFor(version: .version2)
        )
    }

    @Test func testParseFrameContentSizeV3() {
        let mp3 = NSData(contentsOfFile: PathLoader().pathFor(name: "example", fileType: "mp3"))!
        let id3FrameSizeParser = ID3FrameSizeParser(
                frameContentSizeParser: MockFrameContentSizeParser(),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        #expect(
                id3FrameSizeParser.parse(
                    mp3: mp3, framePosition: ID3TagConfiguration().headerSize(),
                    version: .version3
                ) ==
                mp3.length + ID3FrameConfiguration().headerSizeFor(version: .version3)
        )
    }
}
