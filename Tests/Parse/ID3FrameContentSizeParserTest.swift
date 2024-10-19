//
//  ID3FrameContentSizeParserTest.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
import Testing

@testable import ID3TagEditor

@Suite struct ID3FrameContentSizeParserTest {
    @Test func testParseFrameContentSizeV2() {
        let id3FrameContentSizeParser = ID3FrameContentSizeParser(
            id3FrameConfiguration: ID3FrameConfiguration(),
            synchsafeIntegerDecoder: SynchsafeIntegerDecoder()
        )
        let mp3 = NSData(contentsOfFile: PathLoader().pathFor(name: "example", fileType: "mp3"))!
        #expect(
            id3FrameContentSizeParser.parse(
                    mp3: mp3,
                    framePosition: ID3TagConfiguration().headerSize(),
                    version: .version2
            ) ==
            31
        )
    }

    @Test func testParseFrameContentSizeV3() {
        let id3FrameContentSizeParser = ID3FrameContentSizeParser(
            id3FrameConfiguration: ID3FrameConfiguration(),
            synchsafeIntegerDecoder: SynchsafeIntegerDecoder()
        )
        let mp3 = NSData(contentsOfFile: PathLoader().pathFor(name: "example-v23-png", fileType: "mp3"))!
        #expect(
            id3FrameContentSizeParser.parse(
                    mp3: mp3,
                    framePosition: ID3TagConfiguration().headerSize(),
                    version: .version3
            ) ==
            13
        )
    }

    @Test func testParseFrameContentSizeV4() {
        let id3FrameContentSizeParser = ID3FrameContentSizeParser(
            id3FrameConfiguration: ID3FrameConfiguration(),
            synchsafeIntegerDecoder: SynchsafeIntegerDecoder()
        )
        let mp3 = NSData(contentsOfFile: PathLoader().pathFor(name: "example-v4-png", fileType: "mp3"))!
        #expect(
            id3FrameContentSizeParser.parse(
                mp3: mp3,
                framePosition: ID3TagConfiguration().headerSize(),
                version: .version4
            ) ==
            14
        )
    }
}
