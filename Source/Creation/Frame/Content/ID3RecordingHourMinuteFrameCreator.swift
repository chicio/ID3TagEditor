//
//  ID3RecordingHourMinuteFrameCreator.swift
//
//  Created by Fabrizio Duroni on 05/08/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3RecordingHourMinuteFrameCreator: ID3FrameCreator {
    private let frameCreator: FrameFromStringContentCreator

    init(frameCreator: FrameFromStringContentCreator) {
        self.frameCreator = frameCreator
    }

    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let hourMinuteFrame = id3Tag.frames[.recordingHourMinute] as? ID3FrameRecordingHourMinute,
            let hour = hourMinuteFrame.hour,
            let minute = hourMinuteFrame.minute {
            let hourAsString = String(format: "%02d", hour)
            let minuteAsString = String(format: "%02d", minute)
            let recordingHourMinute = hourAsString + minuteAsString
            return frameCreator.createFrame(
                frameType: .recordingHourMinute,
                version: id3Tag.properties.version,
                content: recordingHourMinute
            )
        }
        return []
    }
}
