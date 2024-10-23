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
    private let tagVersionParser: TagVersionParser
    private let tagPresence: TagPresence

    init(tagSizeParser: TagSizeParser,
         id3TagConfiguration: ID3TagConfiguration,
         tagVersionParser: TagVersionParser,
         tagPresence: TagPresence) {
        self.tagSizeParser = tagSizeParser
        self.id3TagConfiguration = id3TagConfiguration
        self.tagVersionParser = tagVersionParser
        self.tagPresence = tagPresence
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

      - returns: ID3 header data or nil, if a tag doesn't exists in the file.

      - throws: Could throw `InvalidFileFormat` if an mp3 file doesn't exists at the specified path.
      Could throw `CorruptedFile` if the file is corrupted.
     */
    func readID3TagFrom(path: String) throws -> Data? {
        let validPath = URL(fileURLWithPath: path)
        guard validPath.pathExtension.caseInsensitiveCompare("mp3") == ComparisonResult.orderedSame else {
            throw ID3TagEditorError.invalidFileFormat
        }

        let readHandle = try FileHandle(forReadingFrom: URL(fileURLWithPath: path))
        defer {
            if #available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *) {
                try? readHandle.close()
            } else {
                readHandle.closeFile()
            }
        }

        let headerSize = id3TagConfiguration.headerSize()
        let header = try read(bytesCount: headerSize, from: readHandle)

        // Verify that there is a valid ID3 tag to parse the size from
        let version = tagVersionParser.parse(mp3: header)
        guard tagPresence.isTagPresentIn(mp3: header, version: version) else {
            return nil
        }

        let frameSize = tagSizeParser.parse(data: header as NSData)
        let frame = try read(bytesCount: Int(frameSize), from: readHandle)

        return header + frame
    }

    private func read(bytesCount: Int, from fileHandle: FileHandle) throws -> Data {
        let result = try {
            if #available(macOS 10.15.4, iOS 13.4, watchOS 6.2, tvOS 13.4, *) {
                return try fileHandle.read(upToCount: bytesCount)
            } else {
                return fileHandle.readData(ofLength: bytesCount)
            }
        }()

        guard let result, result.count == bytesCount else {
            throw ID3TagEditorError.corruptedFile
        }

        return result
    }
}
