//
//  ID3TrackPositionCreatorTest.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3TrackPositionCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoTrackPosition() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3TrackPositionFrameCreator = ID3TrackPositionFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .trackPosition
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3TrackPositionFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsATrackPosition() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID32v3TagBuilder()
            .trackPosition(frame: ID3FramePartOfTotal(part: 1, total: 10))
            .build()

        let id3GenreFrameCreator = ID3TrackPositionFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .trackPosition
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3GenreFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsATrackPosition", testFrameCreationWhenThereIsATrackPosition),
        ("testNoFrameCreationWhenThereIsNoTrackPosition", testNoFrameCreationWhenThereIsNoTrackPosition)
    ]
}
