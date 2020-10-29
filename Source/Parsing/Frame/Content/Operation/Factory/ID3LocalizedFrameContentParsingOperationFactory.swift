//
//  ID3LocalizedFrameContentParsingOperationFactory.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 12.10.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3LocalizedFrameContentParsingOperationFactory {
    static func make(
        frameName: @escaping (ID3FrameContentLanguage) -> FrameName
    ) -> ID3LocalizedFrameContentParsingOperation {
        let id3FrameConfiguration = ID3FrameConfiguration()
        return ID3LocalizedFrameContentParsingOperation(
            id3FrameConfiguration: id3FrameConfiguration,
            paddingRemover: PaddingRemoverUsingTrimming(),
            stringEncodingDetector: ID3FrameStringEncodingDetector(
                id3FrameConfiguration: id3FrameConfiguration,
                id3StringEncodingConverter: ID3StringEncodingConverter()
            ),
            frameName: frameName
        )
    }
}
