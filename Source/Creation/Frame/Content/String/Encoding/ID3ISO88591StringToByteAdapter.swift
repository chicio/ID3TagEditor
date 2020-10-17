//
//  ID3ISO88591StringToByteAdapter.swift
//
//  Created by Fabrizio Duroni on 27/04/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3ISO88591StringToByteAdapter: StringToBytesAdapter {
    private let paddingAdder: PaddingAdder
    private let frameConfiguration: ID3FrameConfiguration

    init(paddingAdder: PaddingAdder, frameConfiguration: ID3FrameConfiguration) {
        self.paddingAdder = paddingAdder
        self.frameConfiguration = frameConfiguration
    }

    func adapt(string: String, for version: ID3Version) -> [UInt8] {
        return frameConfiguration.encodingByteFor(version: version, encoding: .ISO88591) +
            paddingAdder.addTo(content: [UInt8](string.utf8), numberOfByte: 1)
    }
}
