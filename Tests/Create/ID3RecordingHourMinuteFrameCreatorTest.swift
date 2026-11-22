//
//  ID3RecordingHourMinuteFrameCreatorTest.swift
//
//  Created by Fabrizio Duroni on 05/08/2018.
//  2018 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct ID3RecordingHourMinuteFrameCreatorTest {
    @Test func testNoFrameCreationWhenThereIsNoHour() {
        let id3HourMinuteFrameCreator = ID3RecordingHourMinuteFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [1, 1],
                frameTypeToBeChecked: .recordingHourMinute
            )
        )
        let tag = ID3Tag(
            version: .version3,
            frames: [.recordingHourMinute: ID3FrameRecordingHourMinute(hour: nil, minute: 1)]
        )

        let newTagBytes = id3HourMinuteFrameCreator.createFrames(id3Tag: tag)

        #expect(newTagBytes == [])
    }

    @Test func testNoFrameCreationWhenThereIsNoMinute() {
        let id3HourMinuteFrameCreator = ID3RecordingHourMinuteFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [1, 1],
                frameTypeToBeChecked: .recordingHourMinute
            )
        )
        let tag = ID3Tag(
            version: .version3,
            frames: [.recordingHourMinute: ID3FrameRecordingHourMinute(hour: 1, minute: nil)]
        )

        let newTagBytes = id3HourMinuteFrameCreator.createFrames(id3Tag: tag)

        #expect(newTagBytes == [])
    }

    @Test func testNoFrameCreationWhenThereIsNoRecordingHourMinuteFrame() {
        let id3HourMinuteFrameCreator = ID3RecordingHourMinuteFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [1, 1],
                frameTypeToBeChecked: .recordingHourMinute
            )
        )
        let tag = ID3Tag(version: .version3, frames: [:])

        let newTagBytes = id3HourMinuteFrameCreator.createFrames(id3Tag: tag)

        #expect(newTagBytes == [])
    }

    @Test func testFrameCreationWhenThereIsAnHourAndAMinute() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.recordingHourMinute: ID3FrameRecordingHourMinute(hour: 1, minute: 1)]
        )
        let id3HourMinuteFrameCreator = ID3RecordingHourMinuteFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .recordingHourMinute
            )
        )

        let newTagBytes = id3HourMinuteFrameCreator.createFrames(id3Tag: id3Tag)

        #expect(newTagBytes == newFrameBytes)
    }

    @Test func testFrameContentIsHourAndMinuteZeroPadded() {
        let frameContentCreator = CapturingFrameFromStringContentCreator()
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.recordingHourMinute: ID3FrameRecordingHourMinute(hour: 9, minute: 5)]
        )

        _ = ID3RecordingHourMinuteFrameCreator(frameCreator: frameContentCreator).createFrames(id3Tag: id3Tag)

        #expect(frameContentCreator.content == "0905")
    }
}

private class CapturingFrameFromStringContentCreator: FrameFromStringContentCreator {
    private(set) var content: String?

    func createFrame(frameType: FrameType, version: ID3Version, content: String) -> [UInt8] {
        self.content = content
        return []
    }
}
