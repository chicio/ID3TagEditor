//
//  ID3FrameSizeParser.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameSizeParser: FrameSizeParser {
    private let frameContentSizeParser: FrameContentSizeParser
    private var id3FrameConfiguration: ID3FrameConfiguration

    init(frameContentSizeParser: FrameContentSizeParser, id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameContentSizeParser = frameContentSizeParser
        self.id3FrameConfiguration = id3FrameConfiguration
    }

    func parse(mp3: NSData, framePosition: Int, version: ID3Version) -> Int {
        return frameContentSizeParser.parse(mp3: mp3, framePosition: framePosition, version: version) +
                id3FrameConfiguration.headerSizeFor(version: version)
    }
}
