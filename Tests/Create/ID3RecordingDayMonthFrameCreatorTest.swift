//
//  ID3RecordingDayMonthFrameCreatorTest.swift
//
//  Created by Fabrizio Duroni on 05/08/2018.
//  2018 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct ID3RecordingDayMonthFrameCreatorTest {
    @Test func testNoFrameCreationWhenThereIsNoDay() {
        let id3YearFrameCreator = ID3RecordingDayMonthFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .recordingDayMonth
            )
        )
        let tag = ID3Tag(
            version: .version3,
            frames: [.recordingDayMonth: ID3FrameRecordingDayMonth(day: nil, month: 1)]
        )

        let newTagBytes = id3YearFrameCreator.createFrames(id3Tag: tag)

        #expect(newTagBytes == [])
    }

    @Test func testNoFrameCreationWhenThereIsNoMonth() {
        let id3YearFrameCreator = ID3RecordingDayMonthFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .recordingDayMonth
            )
        )
        let tag = ID3Tag(
            version: .version3,
            frames: [.recordingDayMonth: ID3FrameRecordingDayMonth(day: 1, month: nil)]
        )

        let newTagBytes = id3YearFrameCreator.createFrames(id3Tag: tag)

        #expect(newTagBytes == [])
    }

    @Test func testFrameCreationWhenThereIsADayAndAMonth() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.recordingDayMonth: ID3FrameRecordingDayMonth(day: 1, month: 1)]
        )
        let id3TitleFrameCreator = ID3RecordingDayMonthFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .recordingDayMonth
            )
        )

        let newTagBytes = id3TitleFrameCreator.createFrames(id3Tag: id3Tag)

        #expect(newTagBytes == newFrameBytes)
    }
}
