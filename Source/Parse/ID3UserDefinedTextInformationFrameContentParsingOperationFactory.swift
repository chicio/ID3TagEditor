//
//  ID3UserDefinedTextInformationFrameContentParsingOperationFactory.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 26/07/2025.
//  2025 Fabrizio Duroni.
//

import Foundation

class ID3UserDefinedTextInformationFrameContentParsingOperationFactory {
    static func make() -> ID3UserDefinedTextInformationFrameContentParsingOperation {
        let id3FrameConfiguration = ID3FrameConfiguration()
        return ID3UserDefinedTextInformationFrameContentParsingOperation(
            id3FrameConfiguration: id3FrameConfiguration,
            paddingRemover: PaddingRemoverUsingTrimming(),
            stringEncodingDetector: ID3FrameStringEncodingDetector(
                id3FrameConfiguration: id3FrameConfiguration,
                id3StringEncodingConverter: ID3StringEncodingConverter()
            )
        )
    }
}