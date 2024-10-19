//
//  ID3TagVersionParserTest.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
import Testing

@testable import ID3TagEditor

struct ID3TagVersionParserTest {
    @Test func testExtractVersion2() throws {
        let mp3WithV2Tag = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example", fileType: "mp3"))
        )
        #expect(.version2 == ID3TagVersionParser().parse(mp3: mp3WithV2Tag))
    }

    @Test func testExtractVersion3() throws {
        let mp3WithV2Tag = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-v23", fileType: "mp3"))
        )
        #expect(.version3 == ID3TagVersionParser().parse(mp3: mp3WithV2Tag))
    }

    @Test func testShortData() throws {
        let shortData = Data(capacity: 2)
        #expect(.version3 == ID3TagVersionParser().parse(mp3: shortData))
    }

    @Test func testDefaultVersion() throws {
        let mp3WithV2Tag = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"))
        )
        #expect(.version3 == ID3TagVersionParser().parse(mp3: mp3WithV2Tag))
    }
}
