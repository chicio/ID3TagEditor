//
//  Mp3FileReader.swift
//
//  Created by Fabrizio Duroni on 19/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class Mp3FileReader {
    private let tagSizeParser: TagSizeParser
    private let id3TagConfiguration: ID3TagConfiguration

    init(tagSizeParser: TagSizeParser,
         id3TagConfiguration: ID3TagConfiguration) {
        self.tagSizeParser = tagSizeParser
        self.id3TagConfiguration = id3TagConfiguration
    }

    /**
      Read the entire mp3 file at path

      - parameter path: the path to the mp3 file

      - returns: mp3 data of the file

      - throws: Could throw `InvalidFileFormat` if an mp3 file doesn't exists at the specified path.
     */
    func readFileFrom(path: String) throws -> Data {
        let validPath = URL(fileURLWithPath: path)
        guard validPath.pathExtension.caseInsensitiveCompare("mp3") == ComparisonResult.orderedSame else {
            throw ID3TagEditorError.invalidFileFormat
        }

        let mp3 = try Data(contentsOf: validPath)
        return mp3
    }

    /**
      Read only the ID3 header of the mp3 file at path

      - parameter path: the path to the mp3 file

      - returns: ID3 header data of the file

      - throws: Could throw `InvalidFileFormat` if an mp3 file doesn't exists at the specified path, or if the file
     does not contain the entire ID3 header
     */
    func readID3HeaderFrom(path: String) throws -> Data {
        let validPath = URL(fileURLWithPath: path)
        guard validPath.pathExtension.caseInsensitiveCompare("mp3") == ComparisonResult.orderedSame else {
            throw ID3TagEditorError.invalidFileFormat
        }

        guard let inputStream = InputStream(fileAtPath: path) else {
            throw ID3TagEditorError.corruptedFile
        }

        inputStream.open()

        let headerSize = id3TagConfiguration.headerSize()
        let header = try read(bytesCount: headerSize, fromStream: inputStream)
        let headerData = Data(header) as NSData

        let tagsSize = tagSizeParser.parse(data: headerData)
        let tags = try read(bytesCount: Int(tagsSize), fromStream: inputStream)

        let mp3 = header + tags
        return Data(mp3)
    }

    private func read(bytesCount: Int, fromStream stream: InputStream) throws -> [UInt8] {
        var buffer = [UInt8](repeating: 0, count: bytesCount)
        let result = stream.read(&buffer, maxLength: bytesCount)
        if result < bytesCount {
            throw ID3TagEditorError.corruptedFile
        }
        return buffer
    }
}
