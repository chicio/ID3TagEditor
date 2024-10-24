//
//  ID3TagPresenceTest.swift
//
//  Created by Fabrizio Duroni on 19/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
import Testing

@testable import ID3TagEditor

struct ID3TagPresenceTest {
    @Test func testHeaderVersion2IsPresent() {
        let id3TagConfiguration = ID3TagConfiguration()
        let mp3Sample = Data(id3TagConfiguration.headerFor(version: .version2) + [0x1, 0x1])
        let presence = ID3TagPresence(id3TagConfiguration: id3TagConfiguration)

        #expect(presence.isTagPresentIn(mp3: mp3Sample, version: .version2))
    }

    @Test func testHeaderVersion3IsPresent() {
        let id3TagConfiguration = ID3TagConfiguration()
        let mp3Sample = Data(id3TagConfiguration.headerFor(version: .version3) + [0x1, 0x1])
        let presence = ID3TagPresence(id3TagConfiguration: id3TagConfiguration)

        #expect(presence.isTagPresentIn(mp3: mp3Sample, version: .version3))
    }
    @Test func testTagNotPresentSizeTooSmall() {
        let id3TagConfiguration = ID3TagConfiguration()
        let mp3Sample = Data([0x1, 0x1])
        let presence = ID3TagPresence(id3TagConfiguration: id3TagConfiguration)

        #expect(!presence.isTagPresentIn(mp3: mp3Sample, version: .version2))
        #expect(!presence.isTagPresentIn(mp3: mp3Sample, version: .version3))
    }

    @Test func testTagNotPresent() {
        let id3TagConfiguration = ID3TagConfiguration()
        let mp3Sample = Data([0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1])
        let presence = ID3TagPresence(id3TagConfiguration: id3TagConfiguration)

        #expect(!presence.isTagPresentIn(mp3: mp3Sample, version: .version2))
        #expect(!presence.isTagPresentIn(mp3: mp3Sample, version: .version3))
    }
}
