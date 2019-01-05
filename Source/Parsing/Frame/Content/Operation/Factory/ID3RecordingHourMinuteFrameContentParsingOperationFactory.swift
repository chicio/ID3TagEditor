//
//  ID3RecordingHourMinuteFrameContentParsingOperationFactory.swift
//
//  Created by Fabrizio Duroni on 05/08/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3RecordingHourMinuteFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (id3Tag: ID3Tag, content: String) in
            let hourMinute = ID3CoupleOfNumbersAdapter().adapt(coupleOfNumbers: content)
            id3Tag.frames[.RecordingHourMinute] = ID3FrameRecordingHourMinute(hour: hourMinute.0, minute: hourMinute.1)
        }
    }
}
