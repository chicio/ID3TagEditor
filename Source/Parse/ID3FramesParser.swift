//
//  ID3FramesParser.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FramesParser {
    private let frameSizeParser: FrameSizeParser
    private let id3FrameParser: ID3FrameParser
    private var id3TagConfiguration: ID3TagConfiguration

    init(frameSizeParser: FrameSizeParser, id3FrameParser: ID3FrameParser, id3TagConfiguration: ID3TagConfiguration) {
        self.frameSizeParser = frameSizeParser
        self.id3FrameParser = id3FrameParser
        self.id3TagConfiguration = id3TagConfiguration
    }

    func parse(mp3: NSData, id3Tag: ID3Tag) {
        var currentFramePosition = id3TagConfiguration.headerSize()
        while currentFramePosition < id3Tag.properties.size {
            let frameSize = frameSizeParser.parse(
                mp3: mp3,
                framePosition: currentFramePosition,
                version: id3Tag.properties.version
            )
            /*
                Fallback added in order to avoid crashing with non standard tag that doesn't support synchsafe size.
                See https://github.com/chicio/ID3TagEditor/issues/88
             */
            if frameSize < id3Tag.properties.size && currentFramePosition + frameSize <= mp3.length {
                let frame = mp3.subdata(with: NSRange(location: currentFramePosition, length: frameSize))
                id3FrameParser.parse(frame: frame, frameSize: frameSize, id3Tag: id3Tag)
                currentFramePosition += frame.count
            } else {
                currentFramePosition = Int(id3Tag.properties.size)
            }
        }
    }
}
