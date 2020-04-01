//
//  ID3TrackPositionCreatorTest.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3TrackPositionFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoTrackPosition() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3TrackPositionFrameCreator = ID3TrackPositionFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .TrackPosition
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3TrackPositionFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsATrackPosition() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.TrackPosition : ID3FramePartOfTotal(part: 1, total: 10)]
        )
        let id3GenreFrameCreator = ID3TrackPositionFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .TrackPosition
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3GenreFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
