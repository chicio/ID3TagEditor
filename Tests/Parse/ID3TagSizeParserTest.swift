//
//  ID3TagSizeParserTest.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
import Testing

@testable import ID3TagEditor

struct ID3TagSizeParserTest {
    @Test func parseTagSizeV2() {
        let mp3 = NSData(contentsOfFile: PathLoader().pathFor(name: "example", fileType: "mp3"))!
        #expect(ID3TagSizeParser().parse(data: mp3) == 34213)
    }

    @Test func parseTagSizeV3() {
        let mp3V23 = NSData(contentsOfFile: PathLoader().pathFor(name: "example-v23", fileType: "mp3"))!
        #expect(ID3TagSizeParser().parse(data: mp3V23) == 245864)
    }
}
