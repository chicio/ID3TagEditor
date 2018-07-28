//
//  ID3RecordingDateTimeFrameCreatorTest.swift
//
//  Created by Fabrizio Duroni on 28/07/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

//class ID3RecordingDateTimeFrameCreatorTest: XCTestCase {
//
//    func testFrameCreationWhenThereIsACompleteRecordingDateTime() {
//        let newFrameBytes: [UInt8] = [1, 1]
//        let tagAsBytes: [UInt8] = [1, 1, 1]
//        let id3Tag = ID3Tag(version: .version4, size: 0)
//        id3Tag.recordingDateTime?.date?.day = "28"
//        id3Tag.recordingDateTime?.date?.month = "7"
//        id3Tag.recordingDateTime?.date?.year = "2018"
//        id3Tag.recordingDateTime?.time?.hour = "12"
//        id3Tag.recordingDateTime?.time?.minute = "30"
//        id3Tag.recordingDateTime?.time?.second = "15"
//        let id3TitleFrameCreator = ID3RecordingYearFrameCreator(
//            frameCreator: MockFrameFromStringContentCreator(
//                fakeNewFrameAsByte: newFrameBytes,
//                frameTypeToBeChecked: .RecordingYear
//            ),
//            id3FrameConfiguration: ID3FrameConfiguration()
//        )
//
//        let newTagBytes = id3TitleFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
//
//        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
//    }
//}
//
//class ID3RecordingDateTimeFrameCreator: ID3StringFrameCreator {
//    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
//        if id3Tag.properties.version >= .version4, let year = id3Tag.recordingDateTime?.date?.year {
//            return createFrameUsing(frameType: .RecordingYear, content: year, id3Tag: id3Tag, andAddItTo: tag)
//        }
//        return super.createFrames(id3Tag: id3Tag, tag: tag)
//    }
//}

