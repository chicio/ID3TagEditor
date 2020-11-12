//
//  ID3RecordingDayMonthFrameCreator.swift
//
//  Created by Fabrizio Duroni on 05/08/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3RecordingDayMonthFrameCreator: ID3FrameCreator {
    private let frameCreator: FrameFromStringContentCreator

    init(frameCreator: FrameFromStringContentCreator) {
        self.frameCreator = frameCreator
    }

    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let dayMonthFrame = id3Tag.frames[.recordingDayMonth] as? ID3FrameRecordingDayMonth,
            let day = dayMonthFrame.day,
            let month = dayMonthFrame.month {
            let dayAsString = String(format: "%02d", day)
            let monthAsString = String(format: "%02d", month)
            let recordingDayMonth = dayAsString + monthAsString
            return frameCreator.createFrame(
                frameType: .recordingDayMonth,
                version: id3Tag.properties.version,
                content: recordingDayMonth
            )
        }
        return []
    }
}
