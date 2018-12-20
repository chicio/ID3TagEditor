//
//  ID3FrameContentSizeParser.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameContentSizeParser: FrameContentSizeParser {
    private let id3FrameConfiguration: ID3FrameConfiguration

    init(id3FrameConfiguration: ID3FrameConfiguration) {
        self.id3FrameConfiguration = id3FrameConfiguration
    }

    func parse(mp3: NSData, framePosition: Int, version: ID3Version) -> Int {
        if version == .version4 {
            let frameSizePosition = framePosition + id3FrameConfiguration.sizeOffsetFor(version: version)
            var frameSize: UInt32 = 0
            mp3.getBytes(&frameSize, range: NSMakeRange(frameSizePosition, 4))
            frameSize = frameSize.bigEndian & id3FrameConfiguration.sizeMaskFor(version: version)
            let b1 = (frameSize & 0x7F000000) >> 3
            let b2 = (frameSize & 0x007F0000) >> 2
            let b3 = (frameSize & 0x00007F00) >> 1
            let b4 =  frameSize & 0x0000007F
            frameSize = b1 + b2 + b3 + b4
            return Int(frameSize)
        } else {
            let frameSizePosition = framePosition + id3FrameConfiguration.sizeOffsetFor(version: version)
            var frameSize: UInt32 = 0
            mp3.getBytes(&frameSize, range: NSMakeRange(frameSizePosition, 4))
            frameSize = frameSize.bigEndian & id3FrameConfiguration.sizeMaskFor(version: version)
            return Int(frameSize)
        }
    }
}
