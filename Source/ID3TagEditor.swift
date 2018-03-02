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
    private let currentId3Tag: ID3Tag?
    private let newId3Tag: ID3Tag
    private var path: String
    private lazy var newMp3: Data? = {
        do {
            return try mp3WithID3TagBuilder.buildMp3WithNewTag(
                mp3: mp3,
                id3Tag: newId3Tag,
                consideringThereIsAn: currentId3Tag
            )
        } catch {
            return nil
        }
    }()

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
        self.currentId3Tag = id3TagParser.parse(mp3: validMp3)
        self.newId3Tag = currentId3Tag ?? ID3Tag(version: .version3, size: 0)
        self.mp3WithID3TagBuilder = Mp3WithID3TagBuilder(id3TagCreator: ID3TagCreatorFactory.make(),
                                                         id3TagConfiguration: ID3TagConfiguration())
    }

    /**
     Get the artwork contained in the ID3 tag of the file.
     
     - returns: NSData if artwork exists or `nil` otherwise
     */
    public func getArtwork() -> Data? {
        return currentId3Tag?.artwork.art
    }

    /**
     Get the artist contained in the ID3 tag of the file.
     
     - returns: The artist or nil if it not available.
     */
    public func getArtist() -> String? {
        return currentId3Tag?.artist
    }

    /**
     Get the title contained in the ID3 tag of the file.
     
     - returns: The title or nil if it not available.
     */
    public func getTitle() -> String? {
        return currentId3Tag?.title
    }

    /**
     Get the album contained in the ID3 tag of the file.
     
     - returns: The album or nil if it not available.
    */
    public func getAlbum() -> String? {
        return currentId3Tag?.album
    }

    /**
     Set the artist for the ID3 tag of the the file.
     
     - parameter artist: The artist to be used to create/update the ID3 tag.
     */
    public func setArtist(artist: String) {
        newId3Tag.artist = artist
    }

    /**
     Set the title for the ID3 tag of the file.
     
     - parameter title: The title to be used to create/update the ID3 tag.
     */
    public func setTitle(title: String) {
        newId3Tag.title = title
    }

    /**
     Set the album for the ID3 tag of the file.
     
     - parameter album: The album to be used to create/update the ID3 tag.
     */
    public func setAlbum(album: String) {
        newId3Tag.album = album
    }

    /**
    Set the artwork for the ID3 tag of the file.

    - parameter artwork: the image to be used as artwork to create/update the ID3 tag.
    - parameter isPNG: a flag to check if the image is a png or not.
    */
    public func setArtwork(artwork: Data, isPNG: Bool) {
        newId3Tag.artwork.art = artwork
        newId3Tag.artwork.isPNG = isPNG
    }
    
    public func generate() throws -> Data? {
        return newMp3
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
    public func write(to newPath: String? = nil) throws {
        try mp3WithID3TagBuilder.buildMp3WithNewTagAndSaveUsing(
                mp3: mp3,
                id3Tag: newId3Tag,
                consideringThereIsAn: currentId3Tag,
                andSaveTo: newPath ?? path
        )
    }
}
