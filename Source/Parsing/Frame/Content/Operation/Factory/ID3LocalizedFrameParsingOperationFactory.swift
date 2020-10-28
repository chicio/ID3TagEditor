//
//  ID3LocalizedFrameParsingOperationFactory.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 12.10.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3LocalizedFrameParsingOperationFactory {
    static func make(frameName: @escaping (ID3FrameContentLanguage) -> FrameName) -> ID3LocalizedFrameParsingOperation {
        let id3FrameConfiguration = ID3FrameConfiguration()
        return ID3LocalizedFrameParsingOperation(
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
