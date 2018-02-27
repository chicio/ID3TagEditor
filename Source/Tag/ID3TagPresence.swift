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

    func isTagPresentIn(mp3: Data, version: UInt8) -> Bool {
        let header = [UInt8](mp3.subdata(in: Range(0..<6)))
        return header.elementsEqual(id3TagConfiguration.headerFor(version: version))
    }
}
