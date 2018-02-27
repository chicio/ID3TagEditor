//
//  ID3TagEditorError.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

public enum ID3TagEditorError: Error {
    case InvalidFileFormat;
    case TagTooBig;
    case InvalidTagData;
}
