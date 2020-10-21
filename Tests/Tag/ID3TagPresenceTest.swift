//
//  ID3TagPresenceTest.swift
//
//  Created by Fabrizio Duroni on 19/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3TagPresenceTest: XCTestCase {
    func testHeaderVersion2IsPresent() {
        let id3TagConfiguration = ID3TagConfiguration()
        let mp3Sample = Data(id3TagConfiguration.headerFor(version: .version2) + [0x1, 0x1])
        let presence = ID3TagPresence(id3TagConfiguration: id3TagConfiguration)

        XCTAssertTrue(presence.isTagPresentIn(mp3: mp3Sample, version: .version2))
    }

    func testHeaderVersion3IsPresent() {
        let id3TagConfiguration = ID3TagConfiguration()
        let mp3Sample = Data(id3TagConfiguration.headerFor(version: .version3) + [0x1, 0x1])
        let presence = ID3TagPresence(id3TagConfiguration: id3TagConfiguration)

        XCTAssertTrue(presence.isTagPresentIn(mp3: mp3Sample, version: .version3))
    }
    func testTagNotPresentSizeTooSmall() {
        let id3TagConfiguration = ID3TagConfiguration()
        let mp3Sample = Data([0x1, 0x1])
        let presence = ID3TagPresence(id3TagConfiguration: id3TagConfiguration)

        XCTAssertFalse(presence.isTagPresentIn(mp3: mp3Sample, version: .version2))
        XCTAssertFalse(presence.isTagPresentIn(mp3: mp3Sample, version: .version3))
    }

    func testTagNotPresent() {
        let id3TagConfiguration = ID3TagConfiguration()
        let mp3Sample = Data([0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1])
        let presence = ID3TagPresence(id3TagConfiguration: id3TagConfiguration)

        XCTAssertFalse(presence.isTagPresentIn(mp3: mp3Sample, version: .version2))
        XCTAssertFalse(presence.isTagPresentIn(mp3: mp3Sample, version: .version3))
    }

    static let allTests = [
        ("testHeaderVersion2IsPresent", testHeaderVersion2IsPresent),
        ("testHeaderVersion3IsPresent", testHeaderVersion3IsPresent),
        ("testTagNotPresent", testTagNotPresent),
        ("testTagNotPresentSizeTooSmall", testTagNotPresentSizeTooSmall)
    ]
}
