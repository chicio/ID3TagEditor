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
        let frameSizePosition = framePosition + id3FrameConfiguration.sizeOffsetFor(version: version)
        var frameSize: UInt32 = 0
        mp3.getBytes(&frameSize, range: NSMakeRange(frameSizePosition, 4))
        frameSize = frameSize.bigEndian & id3FrameConfiguration.sizeMaskFor(version: version)
        return Int(frameSize)
    }
}
