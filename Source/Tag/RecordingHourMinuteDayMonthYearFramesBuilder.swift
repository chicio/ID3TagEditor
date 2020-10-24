//
//  RecordingHourMinuteDayMonthYearFramesBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

public protocol RecordingHourMinuteDayMonthYearFramesBuilder where Self: ID32TagCommonStringFramesBuilder {
    func recordingDayMonth(frame: ID3FrameRecordingDayMonth) -> Self
    func recordingHourMinute(frame: ID3FrameRecordingHourMinute) -> Self
    func recordingYear(frame: ID3FrameRecordingYear) -> Self
}

public extension RecordingHourMinuteDayMonthYearFramesBuilder {
    func recordingDayMonth(frame: ID3FrameRecordingDayMonth) -> Self {
        frames[.recordingDayMonth] = frame
        return self
    }

    func recordingHourMinute(frame: ID3FrameRecordingHourMinute) -> Self {
        frames[.recordingHourMinute] = frame
        return self
    }

    func recordingYear(frame: ID3FrameRecordingYear) -> Self {
        frames[.recordingYear] = frame
        return self
    }
}
