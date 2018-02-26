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

    func isTagPresentIn(mp3: NSData, version: UInt8) -> Bool {
        var header = [UInt8](repeating: 0, count: 6)
        mp3.getBytes(&header, range: NSMakeRange(0, 6))
        return header == id3TagConfiguration.headerFor(version: version)
    }
}
