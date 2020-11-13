//
//  ID3TagHeaderCreator.swift
//
//  Created by Fabrizio Duroni on 22/12/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TagHeaderCreator {
    private let uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapter
    private let id3TagConfiguration: ID3TagConfiguration

    init(uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapter, id3TagConfiguration: ID3TagConfiguration) {
        self.uInt32ToByteArrayAdapter = uInt32ToByteArrayAdapter
        self.id3TagConfiguration = id3TagConfiguration
    }

    func createTagHeader(contentSize: Int, id3Tag: ID3Tag) -> [UInt8] {
        id3Tag.properties.size = UInt32(contentSize)
        let flags: [UInt8] = [0x00]
        let header = id3TagConfiguration.headerFor(version: id3Tag.properties.version)
            + flags
            + uInt32ToByteArrayAdapter.adapt(uInt32: SynchsafeIntegerEncoder().encode(integer: id3Tag.properties.size))
        return header
    }
}
