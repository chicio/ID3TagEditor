//
//  ID3FrameConfiguration.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameConfiguration {
    private static let version2: UInt8 = 2
    private static let version3: UInt8 = 3
    private let headerSizesInBytes: [UInt8 : Int] = [
        version2 : 6,
        version3 : 10
    ]
    private let headers: [UInt8 : [UInt8]] = [
        version2 : [0x49, 0x44, 0x33, 0x02, 0x00, 0x00],
        version3 : [0x49, 0x44, 0x33, 0x03, 0x00, 0x00]
    ]
    private let sizeOffsetInBytes: [UInt8 : Int] = [
        version2 : 2,
        version3 : 4
    ]
    private let sizeMask: [UInt8 : UInt32] = [
        version2 : 0x00FFFFFF,
        version3 : 0xFFFFFFFF
    ]
    private let identifierSizeInBytes: [UInt8 : Int] = [
        version2 : 3,
        version3 : 4
    ]
    private let identifiers: [UInt8 : [String : [UInt8]]] = [
        version2: [
            "artist" : [0x54, 0x50, 0x31],
            "title" : [0x54, 0x54, 0x32],
            "album" : [0x54, 0x41, 0x4C],
            "artwork" : [0x50, 0x49, 0x43],
        ],
        version3: [
            "artist" : [0x54, 0x50, 0x45, 0x31],
            "title" : [0x54, 0x49, 0x54, 0x32],
            "album" : [0x54, 0x41, 0x4C, 0x42],
            "artwork" : [0x41, 0x50, 0x49, 0x43],
        ]
    ]
    private let nameForIdentifier: [UInt8 : [String : String]] = [
        version2: [
            "TP1" : "artist",
            "TT2" : "title",
            "TAL" : "album",
            "PIC" : "artwork"
        ],
        version3: [
            "TPE1" : "artist",
            "TIT2" : "title",
            "TALB" : "album",
            "APIC" : "artwork"
        ]
    ]

    func headerSizeFor(version: UInt8) -> Int {
        return headerSizesInBytes[version] ?? 0
    }

    func sizeOffsetFor(version: UInt8) -> Int {
        return sizeOffsetInBytes[version] ?? 0
    }

    func sizeMaskFor(version: UInt8) -> UInt32 {
        return sizeMask[version] ?? 0xFFFFFFFF
    }

    func identifierSizeFor(version: UInt8) -> Int {
        return identifierSizeInBytes[version] ?? 0
    }

    func identifierFor(name: String, version: UInt8) -> [UInt8] {
        return identifiers[version]?[name] ?? []
    }

    func nameFor(identifier: String, version: UInt8) -> String {
        return nameForIdentifier[version]?[identifier] ?? ""
    }
}
