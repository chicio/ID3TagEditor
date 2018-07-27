//
//  ID3FrameStringContentParsingOperationFactory.swift
//
//  Created by Fabrizio Duroni on 27/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameStringContentParsingOperationFactory {
    static func make(operation: @escaping AssignToTagOperation) -> ID3FrameStringContentParsingOperation {
        let id3FrameConfiguration = ID3FrameConfiguration()
        let paddingRemover = PaddingRemoverUsingTrimming()
        let stringEncodingDetector = ID3FrameStringEncodingDetector(
            id3FrameConfiguration: id3FrameConfiguration,
            id3StringEncodingConverter: ID3StringEncodingConverter()
        )
        let stringContentParser = ID3FrameStringContentParser(
            stringEncodingDetector: stringEncodingDetector,
            paddingRemover: paddingRemover,
            id3FrameConfiguration: id3FrameConfiguration
        )
        return ID3FrameStringContentParsingOperation(stringContentParser: stringContentParser,
                                                     assignToTagOperation: operation)
    }
}
