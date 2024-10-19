//
//  ID3RecordingTimeFrameParsingOperationTest.swift
//
//  Created by Fabrizio Duroni on 02/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
import Testing

@testable import ID3TagEditor

struct ID3RecordingTimeFrameContentParsingOperationTest {
    @Test func testframeContentValidTimestamp() async {
        let recordingTimeParsingOperation = ID3RecordingTimeFrameContentParsingOperation(
            stringContentParser: ID3FrameStringContentParserFactory.make()
        )

        await confirmation("recording time") { recordingTime in
            recordingTimeParsingOperation.parse(frame: frameV4utf8Valid(),
                                                version: .version4,
                                                completed: {(frameName, frame) in
                #expect(frameName == .recordingDateTime)
                #expect((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.day == 27)
                #expect((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.month == 7)
                #expect((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.year == 2018)
                #expect((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.time?.hour == 11)
                #expect((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.time?.minute == 35)
                recordingTime()
            })
        }
    }

    @Test func testframeContentWithYearInsteadOfTimestamp() async {
        let recordingTimeParsingOperation = ID3RecordingTimeFrameContentParsingOperation(
            stringContentParser: ID3FrameStringContentParserFactory.make()
        )

        await confirmation("recording time") { recordingTime in
            recordingTimeParsingOperation.parse(frame: frameV4utf8Invalid(),
                                                version: .version4,
                                                completed: {(frameName, frame) in
                #expect(frameName == .recordingDateTime)
                #expect((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.day == nil)
                #expect((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.month == nil)
                #expect((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.year == 2016)
                #expect((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.time?.hour == nil)
                #expect((frame as? ID3FrameRecordingDateTime)?.recordingDateTime.time?.minute == nil)
                recordingTime()
            })
        }
    }

    private func frameV4utf8Valid() -> Data {
        return Data(
            [UInt8]("TALB".utf8) + [0x00, 0x00, 0x00, 0x0D, 0x00, 0x00] +
                [0x03] + [UInt8]("1532691310".utf8)
        )
    }

    private func frameV4utf8Invalid() -> Data {
        return Data(
            [UInt8]("TALB".utf8) + [0x00, 0x00, 0x00, 0x0D, 0x00, 0x00] +
                [0x03] + [UInt8]("2016".utf8)
        )
    }
}
