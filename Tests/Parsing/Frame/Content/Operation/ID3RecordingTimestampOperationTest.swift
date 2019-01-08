//
//  ID3RecordingTimeFrameParsingOperationTest.swift
//
//  Created by Fabrizio Duroni on 02/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3RecordingTimeFrameContentParsingOperationTest: XCTestCase {
    func testframeContentValidTimestamp() {
        let expectation = XCTestExpectation(description: "recording time")
        let recordingTimeParsingOperation = ID3RecordingTimeFrameContentParsingOperation(
            stringContentParser: ID3FrameStringContentParserFactory.make()
        )
        
        recordingTimeParsingOperation.parse(frame: frameV4utf8Valid(),
                                            version: .version4,
                                            completed: {(frameName, frame) in
                                                XCTAssertEqual(frameName, .RecordingDateTime)
                                                XCTAssertEqual((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.day, 27)
                                                XCTAssertEqual((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.month, 7)
                                                XCTAssertEqual((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.year, 2018)
                                                XCTAssertEqual((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.time?.hour, 11)
                                                XCTAssertEqual((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.time?.minute, 35)
                                                expectation.fulfill()
                                                
        })
    }
    
    func testframeContentWithYearInsteadOfTimestamp() {
        let expectation = XCTestExpectation(description: "recording time")
        let recordingTimeParsingOperation = ID3RecordingTimeFrameContentParsingOperation(
            stringContentParser: ID3FrameStringContentParserFactory.make()
        )
        
        recordingTimeParsingOperation.parse(frame: frameV4utf8Invalid(),
                                            version: .version4,
                                            completed: {(frameName, frame) in
                                                XCTAssertEqual(frameName, .RecordingDateTime)
                                                XCTAssertNil((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.day)
                                                XCTAssertNil((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.month)
                                                XCTAssertEqual((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.year, 2016)
                                                XCTAssertNil((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.time?.hour)
                                                XCTAssertNil((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.time?.minute)
                                                expectation.fulfill()
        })
    }
    
    private func frameV4utf8Valid() -> Data {
        return Data(bytes:
            [UInt8]("TALB".utf8) + [0x00, 0x00, 0x00, 0x0D, 0x00, 0x00] +
                [0x03] + [UInt8]("1532691310".utf8)
        )
    }
    
    private func frameV4utf8Invalid() -> Data {
        return Data(bytes:
            [UInt8]("TALB".utf8) + [0x00, 0x00, 0x00, 0x0D, 0x00, 0x00] +
                [0x03] + [UInt8]("2016".utf8)
        )
    }
}
