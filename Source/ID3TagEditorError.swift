//
//  ID3TagEditorError.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

/**
 ID3TagEditor errors.
 */
public enum ID3TagEditorError: Error {
    /// Error generated when an invalid file format is passed to the ID3TagEditor.
    case InvalidFileFormat;
    /// Error generated when the tag size exceed 256 MB.
    case TagTooBig;
    /// Error generated when there's not valid data in the tag.
    case InvalidTagData;
    /// Error generated when the file is corrupted.
    case CorruptedFile;
}
