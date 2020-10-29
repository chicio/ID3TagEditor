//
//  ID3RecordingDayMonthFrameCreatorTest.swift
//
//  Created by Fabrizio Duroni on 05/08/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3RecordingDayMonthFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoDay() {
        let id3YearFrameCreator = ID3RecordingDayMonthFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .recordingDayMonth
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        let tag = ID3Tag(
            version: .version3,
            frames: [.recordingDayMonth: ID3FrameRecordingDayMonth(day: nil, month: 1)]
        )

        let newTagBytes = id3YearFrameCreator.createFrames(id3Tag: tag)

        XCTAssertEqual(newTagBytes, [])
    }

    func testNoFrameCreationWhenThereIsNoMonth() {
        let id3YearFrameCreator = ID3RecordingDayMonthFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .recordingDayMonth
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        let tag = ID3Tag(
            version: .version3,
            frames: [.recordingDayMonth: ID3FrameRecordingDayMonth(day: 1, month: nil)]
        )

        let newTagBytes = id3YearFrameCreator.createFrames(id3Tag: tag)

        XCTAssertEqual(newTagBytes, [])
    }

    func testNoFrameCreationWhenIsMajorThanVersion3() {
        let id3YearFrameCreator = ID3RecordingDayMonthFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [2, 2],
                frameTypeToBeChecked: .recordingDayMonth
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        let id3tag = ID3Tag(
            version: .version4,
            frames: [.recordingDayMonth: ID3FrameRecordingDayMonth(day: 1, month: 1)]
        )

        let newTagBytes = id3YearFrameCreator.createFrames(id3Tag: id3tag)

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsADayAndAMonth() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.recordingDayMonth: ID3FrameRecordingDayMonth(day: 1, month: 1)]
        )
        let id3TitleFrameCreator = ID3RecordingDayMonthFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .recordingDayMonth
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3TitleFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsADayAndAMonth", testFrameCreationWhenThereIsADayAndAMonth),
        ("testNoFrameCreationWhenIsMajorThanVersion3", testNoFrameCreationWhenIsMajorThanVersion3),
        ("testNoFrameCreationWhenThereIsNoDay", testNoFrameCreationWhenThereIsNoDay),
        ("testNoFrameCreationWhenThereIsNoMonth", testNoFrameCreationWhenThereIsNoMonth)
    ]
}
