//
//  Mp3FileReaderFactory.swift
//  ID3TagEditor
//
//  Created by Zsolt Kovacs on 09.01.23.
//  Copyright © 2023 Fabrizio Duroni. All rights reserved.
//

import Foundation

class Mp3FileReaderFactory {
    static func make() -> Mp3FileReader {
        let tagSizeParser = ID3TagSizeParser()
        let id3TagConfiguration = ID3TagConfiguration()
        let fileReader = Mp3FileReader(tagSizeParser: tagSizeParser,
                                       id3TagConfiguration: id3TagConfiguration,
                                       tagVersionParser: ID3TagVersionParser(),
                                       tagPresence: ID3TagPresence(id3TagConfiguration: id3TagConfiguration))
        
        return fileReader
    }
}
