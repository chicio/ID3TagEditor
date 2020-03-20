//
//  ID3StringEncodingConverter.swift
//
//  Created by Fabrizio Duroni on 24/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3StringEncodingConverter {
    
    func convert(id3Encoding: ID3StringEncoding?, version: ID3Version) -> String.Encoding {
        if let validId3Encoding = id3Encoding,
            validId3Encoding.exists(in: version) {
            return validId3Encoding.standardLibraryEncoding
        }
        return .isoLatin1
    }
}
