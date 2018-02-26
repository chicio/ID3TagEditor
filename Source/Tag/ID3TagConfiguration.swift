//
//  ID3TagConfiguration.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TagConfiguration {
    private static let version2: UInt8 = 2
    private static let version3: UInt8 = 3
    private let headers: [UInt8 : [UInt8]] = [
        version2 : [0x49, 0x44, 0x33, 0x02, 0x00, 0x00],
        version3 : [0x49, 0x44, 0x33, 0x03, 0x00, 0x00]
    ]
    private let tagHeaderSizeInBytes = 10

    func headerSize() -> Int {
        return tagHeaderSizeInBytes
    }

    func headerFor(version: UInt8) -> [UInt8] {
        return headers[version] ?? []
    }
}
