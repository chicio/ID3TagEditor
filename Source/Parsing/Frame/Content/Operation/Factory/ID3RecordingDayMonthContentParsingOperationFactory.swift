//
//  ID3RecordingDayMonthFrameContentParsingOperationFactory.swift
//
//  Created by Fabrizio Duroni on 05/08/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3RecordingDayMonthFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (id3Tag: ID3Tag, content: String) in
            let dayMonth = ID3CoupleOfNumbersAdapter().adapt(coupleOfNumbers: content)
            id3Tag.recordingDateTime?.date?.day = dayMonth.0
            id3Tag.recordingDateTime?.date?.month = dayMonth.1
        }
    }
}
