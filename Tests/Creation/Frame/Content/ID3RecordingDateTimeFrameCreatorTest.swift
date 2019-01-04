//
//  ID3RecordingDateTimeFrameCreatorTest.swift
//
//  Created by Fabrizio Duroni on 28/07/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3RecordingDateTimeFrameCreatorTest: XCTestCase {    
    func testFrameCreationWhenThereIsACompleteRecordingDateTime() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let recordingDateTime = RecordingDateTime(date: RecordingDate(day: 28, month: 7, year: 2018),
                                                  time: RecordingTime(hour: 12, minute: 30))
        let id3tag = ID3Tag(
            version: .version4,
            frames: [.RecordingDateTime : ID3FrameRecordingDateTime(recordingDateTime: recordingDateTime)]
        )
        let timestampCreator = MockTimestampCreator(returnValue: "123456789")
        
        let id3TitleFrameCreator = ID3RecordingDateTimeFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .RecordingDateTime
            ),
            id3FrameConfiguration: ID3FrameConfiguration(),
            timestampCreator: timestampCreator
        )
        
        let newTagBytes = id3TitleFrameCreator.createFrames(id3Tag: id3tag, tag: tagAsBytes)
        
        XCTAssertTrue(timestampCreator.createFromRecordingDateTimeHasBeenCalled)
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
