//
//  ID3TrackPositionStringAdapterTest.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3TrackPositionStringAdapterTest: XCTestCase {
    let trackPositionStringAdapter = ID3TrackPositionStringAdapter()

    func testAdaptTrackPositionWithTotalTrack() {
        let trackPosition = trackPositionStringAdapter.adapt(trackPosition: "2/9")

        XCTAssertEqual(trackPosition.position, 2)
        XCTAssertEqual(trackPosition.totalTracks, 9)
    }

    func testAdaptTrackPositionWithoutTotalTracks() {
        let trackPosition = trackPositionStringAdapter.adapt(trackPosition: "2")

        XCTAssertEqual(trackPosition.position, 2)
        XCTAssertNil(trackPosition.totalTracks)
    }

    func testAdaptNotANumberTrackPosition() {
        let trackPosition = trackPositionStringAdapter.adapt(trackPosition: "::invalid::")

        XCTAssertEqual(trackPosition.position, 0)
        XCTAssertNil(trackPosition.totalTracks)
    }
}
