//
//  ID32v3TagBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

public class ID32v3TagBuilder: TagBuilder, RecordingHourMinuteDayMonthYearFramesBuilder {
    var frames: [FrameName: ID3Frame] = [:]

    public init() { }

    func recordingDayMonth(frame: ID3FrameRecordingDayMonth) -> RecordingHourMinuteDayMonthYearFramesBuilder {
        frames[.recordingDayMonth] = frame
        return self
    }

    func recordingHourMinute(frame: ID3FrameRecordingHourMinute) -> RecordingHourMinuteDayMonthYearFramesBuilder {
        frames[.recordingHourMinute] = frame
        return self
    }

    func recordingYear(frame: ID3FrameRecordingYear) -> RecordingHourMinuteDayMonthYearFramesBuilder {
        frames[.recordingYear] = frame
        return self
    }

    func build() -> ID3Tag {
        return ID3Tag(version: .version3, frames: frames)
    }
}
