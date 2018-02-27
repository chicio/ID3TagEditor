//
//  ID3TagParser.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import CoreFoundation;
import Foundation;

class ID3TagParser {
    private let tagVersionParser: TagVersionParser
    private let tagPresence: TagPresence
    private let tagSizeParser: TagSizeParser
    private let frameSizeParser: FrameSizeParser
    private let frameContentParser: FrameContentParser
    private var id3TagConfiguration: ID3TagConfiguration

    init(tagVersionParser: TagVersionParser,
         tagPresence: TagPresence,
         tagSizeParser: TagSizeParser,
         frameSizeParser: FrameSizeParser,
         frameContentParser: FrameContentParser,
         id3TagConfiguration: ID3TagConfiguration) {
        self.tagVersionParser = tagVersionParser
        self.tagPresence = tagPresence
        self.tagSizeParser = tagSizeParser
        self.frameSizeParser = frameSizeParser
        self.frameContentParser = frameContentParser
        self.id3TagConfiguration = id3TagConfiguration
    }
    
    func parse(mp3: Data) -> ID3Tag? {
        let version = tagVersionParser.parse(mp3: mp3 as Data)
        if (tagPresence.isTagPresentIn(mp3: mp3 as Data, version: version)) {
            let id3Tag = ID3Tag(version: version, size: 0)
            parseTagSizeFor(mp3: mp3 as NSData, andSaveInId3Tag: id3Tag)
            parseFramesFor(mp3: mp3 as NSData, id3Tag: id3Tag)
            return id3Tag
        }
        return nil
    }

    private func parseTagSizeFor(mp3: NSData, andSaveInId3Tag id3Tag: ID3Tag) {
        id3Tag.size = tagSizeParser.parse(data: mp3);
    }

    private func parseFramesFor(mp3: NSData, id3Tag: ID3Tag) {
        var currentFramePosition = id3TagConfiguration.headerSize();
        while currentFramePosition < id3Tag.size {
            let frame = getFrameFrom(mp3: mp3, position: currentFramePosition, version: id3Tag.version)
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
