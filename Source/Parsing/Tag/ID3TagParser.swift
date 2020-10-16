//
//  ID3TagParser.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TagParser {
    private let tagVersionParser: TagVersionParser
    private let tagPresence: TagPresence
    private let tagSizeParser: TagSizeParser
    private var id3TagConfiguration: ID3TagConfiguration
    private let framesParser: ID3FramesParser

    init(tagVersionParser: TagVersionParser,
         tagPresence: TagPresence,
         tagSizeParser: TagSizeParser,
         id3TagConfiguration: ID3TagConfiguration,
         frameParser: ID3FramesParser) {
        self.tagVersionParser = tagVersionParser
        self.tagPresence = tagPresence
        self.tagSizeParser = tagSizeParser
        self.framesParser = frameParser
        self.id3TagConfiguration = id3TagConfiguration
    }

    func parse(mp3: Data) throws -> ID3Tag? {
        let version = tagVersionParser.parse(mp3: mp3 as Data)
        if tagPresence.isTagPresentIn(mp3: mp3 as Data, version: version) {
            let id3Tag = ID3Tag(version: version, frames: [:])
            parseTagSizeFor(mp3: mp3 as NSData, andSaveInId3Tag: id3Tag)
            try validate(tagSize: id3Tag.properties.size, mp3: mp3)
            framesParser.parse(mp3: mp3 as NSData, id3Tag: id3Tag)
            return id3Tag
        }
        return nil
    }

    private func parseTagSizeFor(mp3: NSData, andSaveInId3Tag id3Tag: ID3Tag) {
        id3Tag.properties.size = tagSizeParser.parse(data: mp3)
    }

    func validate(tagSize: UInt32, mp3: Data) throws {
        if mp3.count < (Int(tagSize) + id3TagConfiguration.headerSize()) {
            throw ID3TagEditorError.corruptedFile
        }
    }
}
