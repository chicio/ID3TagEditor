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
        return [
            ID3RecordingYearFrameCreator(frameCreator: frameFromStringISO88591ContentCreator),
            ID3RecordingDayMonthFrameCreator(frameCreator: frameFromStringISO88591ContentCreator),
            ID3RecordingHourMinuteFrameCreator(frameCreator: frameFromStringISO88591ContentCreator),
            ID3RecordingDateTimeFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, timestampCreator: ID3TimestampCreator())
        ]
    }
}
