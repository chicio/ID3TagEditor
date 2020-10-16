//
//  ID3RecordingHourMinuteFrameCreator.swift
//
//  Created by Fabrizio Duroni on 05/08/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3RecordingHourMinuteFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if id3Tag.properties.version < .version4,
            let hourMinuteFrame = id3Tag.frames[.recordingHourMinute] as? ID3FrameRecordingHourMinute,
            let hour = hourMinuteFrame.hour,
            let minute = hourMinuteFrame.minute {
            let hourAsString = String(format: "%02d", hour)
            let minuteAsString = String(format: "%02d", minute)
            let recordingHourMinute = hourAsString + minuteAsString
            return createFrameUsing(frameType: .recordingHourMinute,
                                    content: recordingHourMinute,
                                    id3Tag: id3Tag,
                                    andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
