//
//  ID3RecordingYearFrameCreatorTest.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 10.11.20.
//  Copyright © 2020 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3RecordingYearFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoYear() {
        let id3YearFrameCreator = ID3RecordingYearFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .recordingYear
                )
        )

        let newTagBytes = id3YearFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsAnYear() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID32v3TagBuilder()
            .recordingYear(frame: ID3FrameRecordingYear(year: 2018))
            .build()

        let id3TitleFrameCreator = ID3RecordingYearFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .recordingYear
                )
        )

        let newTagBytes = id3TitleFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAnYear", testFrameCreationWhenThereIsAnYear),
        ("testNoFrameCreationWhenThereIsNoYear", testNoFrameCreationWhenThereIsNoYear)
    ]
}
