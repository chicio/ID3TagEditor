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
    case invalidFileFormat
    /// Error generated when the tag size exceed 256 MB.
    case tagTooBig
    /// Error generated when there's not valid data in the tag.
    case invalidTagData
    /// Error generated when the file is corrupted.
    case corruptedFile
}
