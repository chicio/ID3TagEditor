//
//  ID3RecordingTimeFrameContentParsingOperationFactory.swift
//
//  Created by Fabrizio Duroni on 27/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3RecordingTimeFrameContentParsingOperationFactory {
    static func make() -> ID3RecordingTimeFrameContentParsingOperation {
        let stringContentParser = ID3FrameStringContentParserFactory.make()
        return ID3RecordingTimeFrameContentParsingOperation(stringContentParser: stringContentParser)
    }
}
