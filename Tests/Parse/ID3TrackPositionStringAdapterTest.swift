//
//  ID3TrackPositionStringAdapterTest.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct ID3TrackPositionStringAdapterTest {
    @Test func testAdaptTrackPositionWithTotalTrack() {
        let trackPosition = ID3PartOfTotalStringAdapter().adapt(partOfTotal: "2/9")

        #expect(trackPosition.part == 2)
        #expect(trackPosition.total == 9)
    }

    @Test func testAdaptTrackPositionWithoutTotalTracks() {
        let trackPosition = ID3PartOfTotalStringAdapter().adapt(partOfTotal: "2")

        #expect(trackPosition.part == 2)
        #expect(trackPosition.total == nil)
    }

    @Test func testAdaptNotANumberTrackPosition() {
        let trackPosition = ID3PartOfTotalStringAdapter().adapt(partOfTotal: "::invalid::")

        #expect(trackPosition.part == 0)
        #expect(trackPosition.total == nil)
    }
}
