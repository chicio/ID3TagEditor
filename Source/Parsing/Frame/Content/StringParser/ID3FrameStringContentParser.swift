//
//  ID3FrameStringContentParser.swift
//
//  Created by Fabrizio Duroni on 27/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameStringContentParser {
    private let stringEncodingDetector: ID3FrameStringEncodingDetector
    private let paddingRemover: PaddingRemover
    private let id3FrameConfiguration: ID3FrameConfiguration
    
    init(stringEncodingDetector: ID3FrameStringEncodingDetector,
         paddingRemover: PaddingRemover,
         id3FrameConfiguration: ID3FrameConfiguration) {
        self.stringEncodingDetector = stringEncodingDetector
        self.paddingRemover = paddingRemover
        self.id3FrameConfiguration = id3FrameConfiguration
    }
    
    func parse(frame: Data, version: ID3Version) -> String? {
        let headerSize = id3FrameConfiguration.headerSizeFor(version: version)
        let frameContentRangeStart = headerSize + id3FrameConfiguration.encodingSize()
        let frameContent = frame.subdata(in: frameContentRangeStart..<frame.count)
        let encoding = stringEncodingDetector.detect(frame: frame, version: version)
        if let frameContentAsString = String(data: frameContent, encoding: encoding) {
            return paddingRemover.removeFrom(string: frameContentAsString)
        } else {
            return nil
        }
    }
}
