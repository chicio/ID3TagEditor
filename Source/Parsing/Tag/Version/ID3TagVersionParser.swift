//
//  ID3TagVersionParser.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TagVersionParser: TagVersionParser {
    private let versionBytesOffset = 3;
    
    func parse(mp3: NSData) -> UInt8 {
        var version: UInt8 = 3
        if (thereAreAtLeast4BytesIn(mp3: mp3)) {
            version = tryToGetVersionFrom(mp3: mp3)
        }
        return version
    }
    
    private func thereAreAtLeast4BytesIn(mp3: NSData) -> Bool {
        return mp3.length >= 4
    }
    
    private func tryToGetVersionFrom(mp3: NSData) -> UInt8 {
        var version = mp3.bytes.assumingMemoryBound(to: UInt8.self)[versionBytesOffset];
        if (isNotAValid(version: version)) {
            version = 3
        }
        return version
    }
    
    private func isNotAValid(version: UInt8) -> Bool {
        return version != 2 && version != 3
    }
}
