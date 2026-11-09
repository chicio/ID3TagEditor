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
        let mp3 = loadMP3(name: "example")
        #expect(ID3TagSizeParser().parse(data: mp3) == 34213)
    }

    @Test func parseTagSizeV3() {
        let mp3V23 = loadMP3(name: "example-v23")
        #expect(ID3TagSizeParser().parse(data: mp3V23) == 245864)
    }

    private func loadMP3(name: String) -> Data {
        let path = PathLoader().pathFor(name: name, fileType: "mp3")
        let url = URL(fileURLWithPath: path)
        let mp3 = try! Data(contentsOf: url)
        return mp3
    }
}
