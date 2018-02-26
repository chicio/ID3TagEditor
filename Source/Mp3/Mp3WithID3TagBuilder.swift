//
//  Mp3WithID3TagBuilder.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class Mp3WithID3TagBuilder {
    private let id3TagCreator: ID3TagCreator
    private let id3TagConfiguration: ID3TagConfiguration

    init(id3TagCreator: ID3TagCreator, id3TagConfiguration: ID3TagConfiguration) {
        self.id3TagCreator = id3TagCreator
        self.id3TagConfiguration = id3TagConfiguration
    }

    public func buildMp3WithNewTagUsing(mp3: NSData,
                                        id3Tag newId3Tag: ID3Tag,
                                        consideringThereIsAn currentId3Tag: ID3Tag?,
                                        andSaveTo path: String) throws {
        let tag = try id3TagCreator.create(id3Tag: newId3Tag)
        var tagSizeWithHeader = 0
        if let validCurrentId3Tag = currentId3Tag {
            tagSizeWithHeader = Int(validCurrentId3Tag.size) + ID3TagConfiguration().headerSize();
        }
        let music = mp3.subdata(with: NSMakeRange(tagSizeWithHeader, mp3.length - tagSizeWithHeader))
        let newMp3 = tag + music
        try newMp3.write(to: URL(fileURLWithPath: path))
    }
}
