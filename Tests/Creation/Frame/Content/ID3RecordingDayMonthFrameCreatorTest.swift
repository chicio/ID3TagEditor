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
        let tagBytes: [UInt8] = [1, 1, 1]
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

        let newTagBytes = id3YearFrameCreator.createFrames(id3Tag: tag, tag: tagBytes)

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testNoFrameCreationWhenThereIsNoMonth() {
        let tagBytes: [UInt8] = [1, 1, 1]
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

        let newTagBytes = id3YearFrameCreator.createFrames(id3Tag: tag, tag: tagBytes)

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testNoFrameCreationWhenIsMajorThanVersion3() {
        let tagBytes: [UInt8] = [1, 1, 1]
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

        let newTagBytes = id3YearFrameCreator.createFrames(id3Tag: id3tag, tag: tagBytes)

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsADayAndAMonth() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
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

        let newTagBytes = id3TitleFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
