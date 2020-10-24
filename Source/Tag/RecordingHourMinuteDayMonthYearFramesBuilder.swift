//
//  RecordingHourMinuteDayMonthYearFramesBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

protocol RecordingHourMinuteDayMonthYearFramesBuilder {
    func recordingDayMonth(frame: ID3FrameRecordingDayMonth) -> RecordingHourMinuteDayMonthYearFramesBuilder
    func recordingHourMinute(frame: ID3FrameRecordingHourMinute) -> RecordingHourMinuteDayMonthYearFramesBuilder
    func recordingYear(frame: ID3FrameRecordingYear) -> RecordingHourMinuteDayMonthYearFramesBuilder
}
