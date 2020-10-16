//
//  ID3FrameContentSizeParser.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameContentSizeParser: FrameContentSizeParser {
    private let id3FrameConfiguration: ID3FrameConfiguration
    private let synchsafeIntegerDecoder: SynchsafeIntegerDecoder

    init(id3FrameConfiguration: ID3FrameConfiguration, synchsafeIntegerDecoder: SynchsafeIntegerDecoder) {
        self.id3FrameConfiguration = id3FrameConfiguration
        self.synchsafeIntegerDecoder = synchsafeIntegerDecoder
    }

    func parse(mp3: NSData, framePosition: Int, version: ID3Version) -> Int {
        var frameSize: UInt32 = getFrameSizeFrom(mp3: mp3, framePosition: framePosition, version: version)
        frameSize = decodeIfIsASynchsafeInteger(frameSize: frameSize, for: version)
        return Int(frameSize)
    }

    private func getFrameSizeFrom(mp3: NSData, framePosition: Int, version: ID3Version) -> UInt32 {
        let frameSizePosition = framePosition + id3FrameConfiguration.sizeOffsetFor(version: version)
        var frameSize: UInt32 = 0
        mp3.getBytes(&frameSize, range: NSRange(location: frameSizePosition, length: 4))
        frameSize = frameSize.bigEndian & id3FrameConfiguration.sizeMaskFor(version: version)
        return frameSize
    }

    private func decodeIfIsASynchsafeInteger(frameSize: UInt32, for version: ID3Version) -> UInt32 {
        var newFrameSize = frameSize
        if version == .version4 {
            newFrameSize = synchsafeIntegerDecoder.decode(integer: frameSize)
        }
        return newFrameSize
    }
}
