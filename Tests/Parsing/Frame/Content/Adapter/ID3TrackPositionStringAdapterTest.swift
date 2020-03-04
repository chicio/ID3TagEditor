//
//  ID3TrackPositionStringAdapterTest.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3TrackPositionStringAdapterTest: XCTestCase {
    let trackPositionStringAdapter = ID3PartOfTotalStringAdapter()

    func testAdaptTrackPositionWithTotalTrack() {
        let trackPosition = trackPositionStringAdapter.adapt(partOfTotal: "2/9")

        XCTAssertEqual(trackPosition.part, 2)
        XCTAssertEqual(trackPosition.total, 9)
    }

    func testAdaptTrackPositionWithoutTotalTracks() {
        let trackPosition = trackPositionStringAdapter.adapt(partOfTotal: "2")

        XCTAssertEqual(trackPosition.part, 2)
        XCTAssertNil(trackPosition.total)
    }

    func testAdaptNotANumberTrackPosition() {
        let trackPosition = trackPositionStringAdapter.adapt(partOfTotal: "::invalid::")

        XCTAssertEqual(trackPosition.part, 0)
        XCTAssertNil(trackPosition.total)
    }
}
