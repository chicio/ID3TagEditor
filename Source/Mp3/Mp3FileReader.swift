//
//  Mp3FileReader.swift
//
//  Created by Fabrizio Duroni on 19/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class Mp3FileReader {
    func readFrom(path: String) throws -> Data {
        let validPath = URL(fileURLWithPath: path)
        guard validPath.pathExtension.caseInsensitiveCompare("mp3") == ComparisonResult.orderedSame else {
            throw ID3TagEditorError.invalidFileFormat
        }
        let mp3 = try Data(contentsOf: validPath)
        return mp3
    }
}
