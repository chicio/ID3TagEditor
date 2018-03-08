//
//  TrackPositionFrameContentParsingOperationTest.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class TrackPositionFrameContentParsingOperationTest: XCTestCase {
    private let value = TrackPositionInSet(position: 2, totalTracks: 9)

    func testSetTagTrackPosition() {
        let tag = ID3Tag(version: .version3, size: 10)
        let trackPositionFrameContentParsingOperation = TrackPositionFrameContentParsingOperation(
                stringContentParsingOperation: MockFrameContentParsingOperation(returnValue: "2/9"),
                trackPositionStringAdapter: MockTrackPositionStringAdapter()
        )

        trackPositionFrameContentParsingOperation.parse(frame: Data(), id3Tag: tag)

        XCTAssertEqual(tag.trackPosition?.position, 2)
        XCTAssertEqual(tag.trackPosition?.totalTracks, 9)
    }
}
