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
        let recordingTimeParsingOperation = ID3RecordingTimeFrameContentParsingOperation(
            stringContentParser: ID3FrameStringContentParserFactory.make()
        )
        let id3Tag = ID3Tag(version: .version4, size: 0)

        recordingTimeParsingOperation.parse(frame: frameV4utf8Valid(), id3Tag: id3Tag)
        
        XCTAssertEqual(id3Tag.recordingDateTime?.date?.day, "27")
        XCTAssertEqual(id3Tag.recordingDateTime?.date?.month, "7")
        XCTAssertEqual(id3Tag.recordingDateTime?.date?.year, "2018")
        XCTAssertEqual(id3Tag.recordingDateTime?.time?.hour, "11")
        XCTAssertEqual(id3Tag.recordingDateTime?.time?.minute, "35")
        XCTAssertEqual(id3Tag.recordingDateTime?.time?.second, "10")
    }
    
    func testframeContentWithYearInsteadOfTimestamp() {
        let recordingTimeParsingOperation = ID3RecordingTimeFrameContentParsingOperation(
            stringContentParser: ID3FrameStringContentParserFactory.make()
        )
        let id3Tag = ID3Tag(version: .version4, size: 0)
        
        recordingTimeParsingOperation.parse(frame: frameV4utf8Invalid(), id3Tag: id3Tag)
        
        XCTAssertNil(id3Tag.recordingDateTime?.date?.day)
        XCTAssertNil(id3Tag.recordingDateTime?.date?.month)
        XCTAssertEqual(id3Tag.recordingDateTime?.date?.year, "2016")
        XCTAssertNil(id3Tag.recordingDateTime?.time?.hour)
        XCTAssertNil(id3Tag.recordingDateTime?.time?.minute)
        XCTAssertNil(id3Tag.recordingDateTime?.time?.second)
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
