//
//  ID3FrameBooleanContentParser.swift
//
//  Created by Nolaine Crusher on 03/30/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameBooleanContentParser {
    private let paddingRemover: PaddingRemover
    private let id3FrameConfiguration: ID3FrameConfiguration
    
    init(paddingRemover: PaddingRemover,
         id3FrameConfiguration: ID3FrameConfiguration) {
        self.paddingRemover = paddingRemover
        self.id3FrameConfiguration = id3FrameConfiguration
    }
    
    func parse(frame: Data, version: ID3Version) -> Bool? {
        let headerSize = id3FrameConfiguration.headerSizeFor(
            version: version)
        let frameContentRangeStart = headerSize
        let frameContent = frame.subdata(in: frameContentRangeStart..<frame.count)
        
        if frameContent.last == 0x00 {
            return false
        } else {
            return true
        }
    }
}
