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
    private let identifiers: [ID3Version : [FrameType : [UInt8]]] = [
        .version2 : [
            .Artist : [0x54, 0x50, 0x31],
            .Title : [0x54, 0x54, 0x32],
            .Album : [0x54, 0x41, 0x4C],
            .AttachedPicture : [0x50, 0x49, 0x43],
            .Year : [0x54, 0x59, 0x45],
            .Genre : [0x54, 0x43, 0x4F],
            .TrackPosition : [0x54, 0x52, 0x4B]
        ],
        .version3 : [
            .Artist : [0x54, 0x50, 0x45, 0x31],
            .Title : [0x54, 0x49, 0x54, 0x32],
            .Album : [0x54, 0x41, 0x4C, 0x42],
            .AttachedPicture : [0x41, 0x50, 0x49, 0x43],
            .Year : [0x54, 0x59, 0x45, 0x52],
            .Genre : [0x54, 0x43, 0x4F, 0x4E],
            .TrackPosition : [0x54, 0x52, 0x43, 0x4B]
        ]
    ]
    private let nameForIdentifier: [ID3Version : [String : FrameType]] = [
        .version2 : [
            "TP1" : .Artist,
            "TT2" : .Title,
            "TAL" : .Album,
            "PIC" : .AttachedPicture,
            "TYE" : .Year,
            "TCO" : .Genre,
            "TRK" : .TrackPosition
        ],
        .version3 : [
            "TPE1" : .Artist,
            "TIT2" : .Title,
            "TALB" : .Album,
            "APIC" : .AttachedPicture,
            "TYER" : .Year,
            "TCON" : .Genre,
            "TRCK" : .TrackPosition
        ]
    ]
    private let encodingPositionInBytes: [ID3Version : Int] = [
        .version2 : 6,
        .version3 : 10
    ]
    private let encodingSizeInBytes: Int = 1

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

    func identifierFor(frameType: FrameType, version: ID3Version) -> [UInt8] {
        return identifiers[version]![frameType]!
    }

    func frameTypeFor(identifier: String, version: ID3Version) -> FrameType {
        return nameForIdentifier[version]![identifier] ?? .Invalid
    }
    
    func encodingSize() -> Int {
        return encodingSizeInBytes
    }
    
    func encodingPositionFor(version: ID3Version) -> Int {
        return encodingPositionInBytes[version]!
    }
}
