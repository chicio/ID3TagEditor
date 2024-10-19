//
//  ID3RecordingDateTimeFrameCreatorTest.swift
//
//  Created by Fabrizio Duroni on 28/07/2018.
//  2018 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct ID3RecordingDateTimeFrameCreatorTest {
    @Test func testFrameCreationWhenThereIsACompleteRecordingDateTime() {
        let newFrameBytes: [UInt8] = [1, 1]
        let recordingDateTime = RecordingDateTime(date: RecordingDate(day: 28, month: 7, year: 2018),
                                                  time: RecordingTime(hour: 12, minute: 30))
        let id3tag = ID3Tag(
            version: .version4,
            frames: [.recordingDateTime: ID3FrameRecordingDateTime(recordingDateTime: recordingDateTime)]
        )
        let timestampCreator = MockTimestampCreator(returnValue: "123456789")

        let id3TitleFrameCreator = ID3RecordingDateTimeFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .recordingDateTime
            ),
            timestampCreator: timestampCreator
        )

        let newTagBytes = id3TitleFrameCreator.createFrames(id3Tag: id3tag)

        #expect(timestampCreator.createFromRecordingDateTimeHasBeenCalled)
        #expect(newTagBytes == newFrameBytes)
    }
}
