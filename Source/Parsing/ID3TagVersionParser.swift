//
//  ID3TagVersionParser.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TagVersionParser: TagVersionParser {
    private let versionBytesOffset = 3

    func parse(mp3: Data) -> ID3Version {
        let version = ID3Version.version3
        if let validVersion = tryToGetVersionFrom(mp3: mp3) {
            return validVersion
        }
        return version
    }

    private func tryToGetVersionFrom(mp3: Data) -> ID3Version? {
        let version = [UInt8](mp3)[versionBytesOffset]
        return ID3Version(rawValue: version)
    }
}
