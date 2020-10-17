//
//  ID3TagConfiguration.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TagConfiguration {
    private let headers: [ID3Version: [UInt8]] = [
        .version2: [UInt8]("ID3".utf8) + [0x02, 0x00],
        .version3: [UInt8]("ID3".utf8) + [0x03, 0x00],
        .version4: [UInt8]("ID3".utf8) + [0x04, 0x00]
    ]
    private let tagHeaderSizeInBytes = 10

    func headerSize() -> Int {
        return tagHeaderSizeInBytes
    }

    func headerFor(version: ID3Version) -> [UInt8] {
        return headers[version]!
    }
}
