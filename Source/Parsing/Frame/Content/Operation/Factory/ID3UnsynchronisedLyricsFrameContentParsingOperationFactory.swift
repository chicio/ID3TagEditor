//
//  ID3UnsynchronisedLyricsFrameContentParsingOperationFactory.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 12.10.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3UnsynchronisedLyricsFrameContentParsingOperationFactory {
    static func make() -> ID3UnsynchronisedLyricsFrameContentParsingOperation {
        let id3FrameConfiguration = ID3FrameConfiguration()
        return ID3UnsynchronisedLyricsFrameContentParsingOperation(
            id3FrameConfiguration: id3FrameConfiguration,
            stringEncodingDetector:  ID3FrameStringEncodingDetector(
                id3FrameConfiguration: id3FrameConfiguration,
                id3StringEncodingConverter: ID3StringEncodingConverter()
            )
        )
    }
}
