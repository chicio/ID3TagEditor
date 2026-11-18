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
        let mp3 = loadMP3(name: "example")
        let id3FrameSizeParser = ID3FrameSizeParser(
                frameContentSizeParser: MockFrameContentSizeParser(),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        #expect(
                id3FrameSizeParser.parse(
                    mp3: mp3, framePosition: ID3TagConfiguration().headerSize(),
                    version: .version2
                ) ==
                mp3.count + ID3FrameConfiguration().headerSizeFor(version: .version2)
        )
    }

    @Test func testParseFrameContentSizeV3() {
        let mp3 = loadMP3(name: "example")
        let id3FrameSizeParser = ID3FrameSizeParser(
                frameContentSizeParser: MockFrameContentSizeParser(),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        #expect(
                id3FrameSizeParser.parse(
                    mp3: mp3, framePosition: ID3TagConfiguration().headerSize(),
                    version: .version3
                ) ==
                mp3.count + ID3FrameConfiguration().headerSizeFor(version: .version3)
        )
    }

    private func loadMP3(name: String) -> Data {
        let path = PathLoader().pathFor(name: name, fileType: "mp3")
        let url = URL(fileURLWithPath: path)
        let mp3 = try! Data(contentsOf: url)
        return mp3
    }
}
