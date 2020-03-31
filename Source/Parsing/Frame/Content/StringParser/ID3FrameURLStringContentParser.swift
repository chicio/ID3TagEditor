//
//  ID3FrameURLStringContentParser.swift
//
//  Created by Fabrizio Duroni on 27/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameURLStringContentParser {
    private let paddingRemover: PaddingRemover
    private let id3FrameConfiguration: ID3FrameConfiguration
    
    init(paddingRemover: PaddingRemover,
         id3FrameConfiguration: ID3FrameConfiguration) {
        self.paddingRemover = paddingRemover
        self.id3FrameConfiguration = id3FrameConfiguration
    }
    
    func parse(frame: Data, version: ID3Version) -> String? {
        let headerSize = id3FrameConfiguration.headerSizeFor(version: version)
        let frameContentRangeStart = headerSize
        let frameContent = frame.subdata(in: frameContentRangeStart..<frame.count)
        if let frameContentAsString = String(data: frameContent, encoding: .ascii) {
            return paddingRemover.removeFrom(string: frameContentAsString)
        } else {
            return nil
        }
    }
}
