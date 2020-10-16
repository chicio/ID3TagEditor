//
//  ID3FrameStringEncodingDetector.swift
//
//  Created by Fabrizio Duroni on 24/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameStringEncodingDetector {
    private let id3FrameConfiguration: ID3FrameConfiguration
    private let id3StringEncodingConverter: ID3StringEncodingConverter

    init(id3FrameConfiguration: ID3FrameConfiguration,
         id3StringEncodingConverter: ID3StringEncodingConverter) {
        self.id3FrameConfiguration = id3FrameConfiguration
        self.id3StringEncodingConverter = id3StringEncodingConverter
    }

    func detect(frame: Data, version: ID3Version) -> String.Encoding {
        let encodingBytePosition = id3FrameConfiguration.encodingPositionFor(version: version)
        let encoding = id3StringEncodingConverter.convert(
            id3Encoding: ID3StringEncoding(rawValue: frame[encodingBytePosition]),
            version: version
        )
        return encoding
    }
}
