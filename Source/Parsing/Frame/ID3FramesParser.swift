//
//  ID3FramesParser.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FramesParser {
    private let frameSizeParser: FrameSizeParser
    private let frameContentParser: FrameContentParser
    private var id3TagConfiguration: ID3TagConfiguration
    
    init(frameSizeParser: FrameSizeParser,
         frameContentParser: FrameContentParser,
         id3TagConfiguration: ID3TagConfiguration) {
        self.frameSizeParser = frameSizeParser
        self.frameContentParser = frameContentParser
        self.id3TagConfiguration = id3TagConfiguration
    }
    
    func parse(mp3: NSData, id3Tag: ID3Tag) {
        var currentFramePosition = id3TagConfiguration.headerSize();
        while currentFramePosition < id3Tag.properties.size {
            let frame = getFrameFrom(mp3: mp3, position: currentFramePosition, version: id3Tag.properties.version)
            frameContentParser.parse(frame: frame, id3Tag: id3Tag)
            currentFramePosition += frame.count;
        }
    }
    
    private func getFrameFrom(mp3: NSData, position: Int, version: ID3Version) -> Data {
        let frameSize = frameSizeParser.parse(mp3: mp3, framePosition: position, version: version)
        let frame = mp3.subdata(with: NSMakeRange(position, frameSize))
        return frame
    }
}
