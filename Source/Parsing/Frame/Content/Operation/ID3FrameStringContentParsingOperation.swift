//
//  ID3FrameStringContentParsingOperation.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameStringContentParsingOperation: FrameContentParsingOperation {
    private let paddingRemover: PaddingRemover
    private var assignToTagOperation: (ID3Tag, String) -> ()
    private let id3FrameConfiguration: ID3FrameConfiguration

    init(paddingRemover: PaddingRemover,
         id3FrameConfiguration: ID3FrameConfiguration,
         assignToTagOperation: @escaping (ID3Tag, String) -> ()) {
        self.paddingRemover = paddingRemover
        self.id3FrameConfiguration = id3FrameConfiguration
        self.assignToTagOperation = assignToTagOperation
    }

    func parse(frame: Data, id3Tag: ID3Tag) {
        let headerSize = id3FrameConfiguration.headerSizeFor(version: id3Tag.properties.version)
        let encodingBytePosition = id3FrameConfiguration.encodingPositionFor(version: id3Tag.properties.version)
        let frameContentRangeStart = headerSize + id3FrameConfiguration.encodingSize()
        let frameContentRange = Range(frameContentRangeStart..<frame.count)
        let encoding = getEncodingFor(id3Encoding: ID3StringEncoding(rawValue: frame[encodingBytePosition]))
        if let frameContent = String(data: frame.subdata(in: frameContentRange), encoding: encoding) {
            assignToTagOperation(id3Tag, paddingRemover.removeFrom(string: frameContent))
        }
    }
    
    private func getEncodingFor(id3Encoding: ID3StringEncoding?) -> String.Encoding {
        if id3Encoding == .UTF16 {
            return .utf16
        }
        return .isoLatin1
    }
}
