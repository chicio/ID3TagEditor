//
//  ID3TagEditor.swift
//
//  Created by Fabrizio Duroni on 19/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation;

public class ID3TagEditor {
    private let id3TagParser: ID3TagParser
    private let mp3WithID3TagBuilder: Mp3WithID3TagBuilder
    private let mp3: Data
    private let newId3Tag: ID3Tag
    private var path: String

    /**
     Init the ID3TagEditor.
     
     - parameter path: the path of the file to be opened to create/edit the ID3Tag.

     - throws: Could throw an `InvalidFileFormat` (only mp3 supported) or Cocoa Domain error if the file at the
     specified path doesn't exist.
     */
    public init(path: String) throws {
        let validPath = URL(fileURLWithPath: path)
        guard validPath.pathExtension.caseInsensitiveCompare("mp3") == ComparisonResult.orderedSame else {
            throw ID3TagEditorError.InvalidFileFormat;
        }
        let validMp3 = try Data(contentsOf: validPath)
        self.path = path
        self.mp3 = validMp3
        self.id3TagParser = ID3TagParserFactory.make()
        self.newId3Tag = self.id3TagParser.parse(mp3: mp3) ?? ID3Tag(version: .version3, size: 0)
        self.mp3WithID3TagBuilder = Mp3WithID3TagBuilder(id3TagCreator: ID3TagCreatorFactory.make(),
                                                         id3TagConfiguration: ID3TagConfiguration())
    }

    /**
     Read the ID3 tag contained in the mp3 file.

     - returns: an ID3 tag or nil, if a tag doesn't exists in the file.
     */
    public func read() -> ID3Tag? {
        return self.id3TagParser.parse(mp3: mp3)
    }

    /**
     Generate a new mp3 with the new ID3 tag and eventually return it as `Data`.

     The ID3 Tag of the file will be changed in the following way:
      * if the file does not have a ID3 tag, a new one will be created. The default version is ID3v2.3.
      * if the file already have has a ID3 tag, this one will be updated (version will be maintained).

     - throws: Could throw `TagTooBig` (tag size > 256 MB) or `InvalidTagData` (no data set to be written in the
     ID3 tag).
     */
    public func generateWith(tag: ID3Tag) throws -> Data {
        return try mp3WithID3TagBuilder.buildMp3WithNewTag(
                mp3: mp3,
                id3Tag: tag,
                consideringThereIsAn: self.id3TagParser.parse(mp3: mp3)
        )
    }

    /**
     Writes the mp3 to a new file or overwrite it with the new ID3 tag.

     The ID3 Tag of the file will be changed in the following way:
     * if the file does not have a ID3 tag, a new one will be created. The default version is ID3v2.3.
     * if the file already have has a ID3 tag, this one will be updated (version will be maintained).

     - parameter newPath: path where the file with the new tag will be written.
     If nothing is passed, the file will be overwritten at its current location.

     - throws: Could throw `TagTooBig` (tag size > 256 MB) or `InvalidTagData` (no data set to be written in the
     ID3 tag).
     */
    public func write(tag: ID3Tag, to newPath: String? = nil) throws {
        try mp3WithID3TagBuilder.buildMp3WithNewTagAndSaveUsing(
                mp3: mp3,
                id3Tag: tag,
                consideringThereIsAn: self.id3TagParser.parse(mp3: mp3),
                andSaveTo: newPath ?? path
        )
    }
}
