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

    func build(mp3: Data, newId3Tag: ID3Tag, currentId3Tag: ID3Tag?) throws -> Data {
        var tagSizeWithHeader = 0
        if let validCurrentId3Tag = currentId3Tag {
            tagSizeWithHeader = Int(validCurrentId3Tag.properties.size) + ID3TagConfiguration().headerSize()
        }
        var mp3WithTag = try id3TagCreator.create(id3Tag: newId3Tag)
        if !mp3.isEmpty {
            mp3WithTag.append(mp3.subdata(in: tagSizeWithHeader..<mp3.count))
        }
        return mp3WithTag
    }
}
