//
//  ID3RecordingYearFrameCreatorTest.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3RecordingYearFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoYear() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3YearFrameCreator = ID3RecordingYearFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .recordingYear
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3YearFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build(),
            tag: tagBytes
        )

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testNoFrameCreationWhenIsMajorThanVersion3() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3YearFrameCreator = ID3RecordingYearFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [2, 2],
                frameTypeToBeChecked: .recordingYear
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        let recordingDateTime = RecordingDateTime(date: RecordingDate(day: nil, month: nil, year: 2018), time: nil)
        let id3tag = ID32v4TagBuilder()
            .recordingDateTime(frame: ID3FrameRecordingDateTime(recordingDateTime: recordingDateTime))
            .build()

        let newTagBytes = id3YearFrameCreator.createFrames(id3Tag: id3tag, tag: tagBytes)

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsAnYear() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID32v3TagBuilder()
            .recordingYear(frame: ID3FrameRecordingYear(year: 2018))
            .build()

        let id3TitleFrameCreator = ID3RecordingYearFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .recordingYear
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3TitleFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAnYear", testFrameCreationWhenThereIsAnYear),
        ("testNoFrameCreationWhenIsMajorThanVersion3", testNoFrameCreationWhenIsMajorThanVersion3),
        ("testNoFrameCreationWhenThereIsNoYear", testNoFrameCreationWhenThereIsNoYear)
    ]
}
