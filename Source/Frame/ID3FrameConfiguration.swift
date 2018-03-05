//
//  ID3FrameConfiguration.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameConfiguration {
    private let headerSizesInBytes: [ID3Version : Int] = [
        .version2 : 6,
        .version3 : 10
    ]
    private let sizeOffsetInBytes: [ID3Version : Int] = [
        .version2 : 2,
        .version3 : 4
    ]
    private let sizeMask: [ID3Version : UInt32] = [
        .version2 : 0x00FFFFFF,
        .version3 : 0xFFFFFFFF
    ]
    private let identifierSizeInBytes: [ID3Version : Int] = [
        .version2 : 3,
        .version3 : 4
    ]
    private let identifiers: [ID3Version : [String : [UInt8]]] = [
        .version2: [
            "artist" : [0x54, 0x50, 0x31],
            "title" : [0x54, 0x54, 0x32],
            "album" : [0x54, 0x41, 0x4C],
            "artwork" : [0x50, 0x49, 0x43],
            "year" : [0x54, 0x59, 0x45],
            "genre" : [0x54, 0x43, 0x4F]
        ],
        .version3: [
            "artist" : [0x54, 0x50, 0x45, 0x31],
            "title" : [0x54, 0x49, 0x54, 0x32],
            "album" : [0x54, 0x41, 0x4C, 0x42],
            "artwork" : [0x41, 0x50, 0x49, 0x43],
            "year" : [0x54, 0x59, 0x45, 0x52],
            "genre" : [0x54, 0x43, 0x4F, 0x4E]
        ]
    ]
    private let nameForIdentifier: [ID3Version : [String : String]] = [
        .version2: [
            "TP1" : "artist",
            "TT2" : "title",
            "TAL" : "album",
            "PIC" : "artwork",
            "TYE" : "year",
            "TCO" : "genre"
        ],
        .version3: [
            "TPE1" : "artist",
            "TIT2" : "title",
            "TALB" : "album",
            "APIC" : "artwork",
            "TYER" : "year",
            "TCON" : "genre"
        ]
    ]

    func headerSizeFor(version: ID3Version) -> Int {
        return headerSizesInBytes[version]!
    }

    func sizeOffsetFor(version: ID3Version) -> Int {
        return sizeOffsetInBytes[version]!
    }

    func sizeMaskFor(version: ID3Version) -> UInt32 {
        return sizeMask[version]!
    }

    func identifierSizeFor(version: ID3Version) -> Int {
        return identifierSizeInBytes[version]!
    }

    func identifierFor(name: String, version: ID3Version) -> [UInt8] {
        return identifiers[version]![name]!
    }

    func nameFor(identifier: String, version: ID3Version) -> String {
        return nameForIdentifier[version]![identifier] ?? ""
    }
}
