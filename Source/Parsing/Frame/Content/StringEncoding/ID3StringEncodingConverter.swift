//
//  ID3StringEncodingConverter.swift
//
//  Created by Fabrizio Duroni on 24/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3StringEncodingConverter {
    private let encodingForVersion: [ID3Version: [ID3StringEncoding: String.Encoding]] = [
        .version2: [
            .ISO88591: .isoLatin1,
            .UTF16: .utf16
        ],
        .version3: [
            .ISO88591: .isoLatin1,
            .UTF16: .utf16
        ],
        .version4: [
            .ISO88591: .isoLatin1,
            .UTF16: .utf16,
            .UTF8: .utf8
        ]
    ]

    func convert(id3Encoding: ID3StringEncoding?, version: ID3Version) -> String.Encoding {
        if let validId3Encoding = id3Encoding,
            let validEncodingForVersion = encodingForVersion[version],
            let validEncoding = validEncodingForVersion[validId3Encoding] {
            return validEncoding
        }
        return .isoLatin1
    }
}
