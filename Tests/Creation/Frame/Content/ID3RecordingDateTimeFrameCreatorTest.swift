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
        let id3Tag = ID3Tag(version: .version4, size: 0)
        id3Tag.recordingDateTime?.date?.day = 28
        id3Tag.recordingDateTime?.date?.month = 7
        id3Tag.recordingDateTime?.date?.year = 2018
        id3Tag.recordingDateTime?.time?.hour = 12
        id3Tag.recordingDateTime?.time?.minute = 30
        let timestampCreator = MockTimestampCreator(returnValue: "123456789")
        
        let id3TitleFrameCreator = ID3RecordingDateTimeFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .RecordingDateTime
            ),
            id3FrameConfiguration: ID3FrameConfiguration(),
            timestampCreator: timestampCreator
        )
        
        let newTagBytes = id3TitleFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertTrue(timestampCreator.createFromRecordingDateTimeHasBeenCalled)
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
