//
//  ID3RecordingTimesFrameCreatorsFactory.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 29.10.20.
//  2020 Fabrizio Duroni.
//

// swiftlint:disable line_length

import Foundation

class ID3RecordingTimesFrameCreatorsFactory {
    static func make() -> [ID3FrameCreator] {
        let frameFromStringISO88591ContentCreator = ID3FrameFromStringContentCreatorWithISO88591EncodingFactory.make()
        let frameConfiguration = ID3FrameConfiguration()
        return [
            ID3RecordingYearFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3RecordingDayMonthFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3RecordingHourMinuteFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3RecordingDateTimeFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration, timestampCreator: ID3TimestampCreator())
        ]
    }
}
