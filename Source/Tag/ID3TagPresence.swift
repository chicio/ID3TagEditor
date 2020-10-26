//
//  ID3TagPresence.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TagPresence: TagPresence {
    private var id3TagConfiguration: ID3TagConfiguration

    init(id3TagConfiguration: ID3TagConfiguration) {
        self.id3TagConfiguration = id3TagConfiguration
    }

    func isTagPresentIn(mp3: Data, version: ID3Version) -> Bool {
        if mp3SizeIsTooSmall(mp3: mp3) {
            return false
        }
        let header = [UInt8](mp3.subdata(in: 0..<5))
        return header.elementsEqual(id3TagConfiguration.headerFor(version: version))
    }

    private func mp3SizeIsTooSmall(mp3: Data) -> Bool {
        return mp3.count < 5
    }
}
