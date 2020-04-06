//
//  ID3TagEditor.swift
//
//  Created by Fabrizio Duroni on 19/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation;

/**
 A class to edit the ID3 tag of an mp3 file.
 */
public class ID3TagEditor {
    private let id3TagParser: ID3TagParser
    private let mp3FileReader: Mp3FileReader
    private let mp3FileWriter: Mp3FileWriter
    private let mp3WithID3TagBuilder: Mp3WithID3TagBuilder

    /**
     Init the ID3TagEditor.
     */
    public init() {
        self.id3TagParser = ID3TagParserFactory.make()
        self.mp3FileReader = Mp3FileReader()
        self.mp3FileWriter = Mp3FileWriter()
        self.mp3WithID3TagBuilder = Mp3WithID3TagBuilder(
            id3TagCreator: ID3TagCreatorFactory.make(),
            id3TagConfiguration: ID3TagConfiguration())
    }

    /**
     Read the ID3 tag contained in the mp3 file.

     - parameter path: path of the mp3 file to be parsed.

     - returns: an ID3 tag or nil, if a tag doesn't exists in the file.
     
     - throws: Could throw `InvalidFileFormat` if an mp3 file doesn't exists at the specified path.
     Could throw `CorruptedFile` if the file is corrupted.
     */
    public func read(from path: String) throws -> ID3Tag? {
        let mp3 = try mp3FileReader.readFrom(path: path)
        return try self.id3TagParser.parse(mp3: mp3)
    }
    
    /**
     Read the ID3 tag contained in the mp3 file passed as `Data`.
     
     - parameter mp3: mp3 file opened as Data.
     
     - returns: an ID3 tag or nil, if a tag doesn't exists in the file.
     
     - throws: Could throw `CorruptedFile` if the file is corrupted.
     */
    public func read(mp3: Data) throws -> ID3Tag? {
        return try self.id3TagParser.parse(mp3: mp3)
    }

    /**
     Writes the mp3 to a new file or overwrite it with the new ID3 tag.

     - parameter tag: the ID3 tag to be written in the mp3 file.
     - parameter path: path of the mp3 file to which the id3 tag will be added.
     - parameter newPath: path where the mp3 file with the new tag will be written.
     **If nil, the mp3 file will be overwritten**.
     If nothing is passed, the file will be overwritten at its current location.

     - throws: Could throw `TagTooBig` (tag size > 256 MB) or `InvalidTagData` (no data set to be written in the
     ID3 tag).
     */
    public func write(tag: ID3Tag, to path: String, andSaveTo newPath: String? = nil) throws {
        let mp3 = try mp3FileReader.readFrom(path: path)
        let currentTag = try self.id3TagParser.parse(mp3: mp3)
        let mp3WithId3Tag = try mp3WithID3TagBuilder.build(mp3: mp3, newId3Tag: tag, currentId3Tag: currentTag)
        try mp3FileWriter.write(mp3: mp3WithId3Tag, path: newPath ?? path)
    }
    
    /**
     Write the ID3 tag passed as parameter to the mp3 file passed as `Data`.
     
     - parameter tag: the ID3 tag to be written in the mp3.
     - parameter mp3: the mp3 on which we want to write the new tag.
     
     - returns: a new `Data` object that contains the mp3 data with the new tag.
     
     - throws: Could throw `TagTooBig` (tag size > 256 MB) or `InvalidTagData` (no data set to be written in the
     ID3 tag).
     */
    public func write(tag: ID3Tag, mp3: Data) throws -> Data {
        let currentTag = try self.id3TagParser.parse(mp3: mp3)
        let mp3WithId3Tag = try mp3WithID3TagBuilder.build(mp3: mp3, newId3Tag: tag, currentId3Tag: currentTag)
        return mp3WithId3Tag
    }
}
