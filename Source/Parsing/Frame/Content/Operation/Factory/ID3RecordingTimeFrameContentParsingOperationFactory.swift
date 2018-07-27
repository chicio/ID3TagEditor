//
//  ID3RecordingTimeFrameContentParsingOperationFactory.swift
//
//  Created by Fabrizio Duroni on 27/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3RecordingTimeFrameContentParsingOperationFactory {
    static func make() -> ID3RecordingTimeFrameContentParsingOperation {
        let id3FrameConfiguration = ID3FrameConfiguration()
        let paddingRemover = PaddingRemoverUsingTrimming()
        let stringEncodingDetector = ID3FrameStringEncodingDetector(
            id3FrameConfiguration: id3FrameConfiguration,
            id3StringEncodingConverter: ID3StringEncodingConverter()
        )
        return ID3RecordingTimeFrameContentParsingOperation(stringEncodingDetector: stringEncodingDetector,
                                                            paddingRemover: paddingRemover,
                                                            id3FrameConfiguration: id3FrameConfiguration
        )
    }
}
