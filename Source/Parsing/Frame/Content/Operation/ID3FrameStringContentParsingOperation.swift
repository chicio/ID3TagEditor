//
//  ID3FrameStringContentParsingOperation.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameStringContentParsingOperation: FrameContentParsingOperation {
    private let stringEncodingDetector: ID3FrameStringEncodingDetector
    private let paddingRemover: PaddingRemover
    private let id3FrameConfiguration: ID3FrameConfiguration
    private var assignToTagOperation: (ID3Tag, String) -> ()

    init(stringEncodingDetector: ID3FrameStringEncodingDetector,
         paddingRemover: PaddingRemover,
         id3FrameConfiguration: ID3FrameConfiguration,
         assignToTagOperation: @escaping (ID3Tag, String) -> ()) {
        self.stringEncodingDetector = stringEncodingDetector
        self.paddingRemover = paddingRemover
        self.id3FrameConfiguration = id3FrameConfiguration
        self.assignToTagOperation = assignToTagOperation
    }

    func parse(frame: Data, id3Tag: ID3Tag) {
        let headerSize = id3FrameConfiguration.headerSizeFor(version: id3Tag.properties.version)
        let frameContentRangeStart = headerSize + id3FrameConfiguration.encodingSize()
        let frameContentRange = Range(frameContentRangeStart..<frame.count)
        let frameContent = frame.subdata(in: frameContentRange)
        let encoding = stringEncodingDetector.detect(frame: frame, version: id3Tag.properties.version)
        if let frameContent = String(data: frameContent, encoding: encoding) {
            assignToTagOperation(id3Tag, paddingRemover.removeFrom(string: frameContent))
        }
    }
}
