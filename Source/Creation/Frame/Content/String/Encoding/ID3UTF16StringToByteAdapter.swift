//
//  ID3UTF16StringToByteAdapter.swift
//
//  Created by Fabrizio Duroni on 27/04/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3UTF16StringToByteAdapter: StringToBytesAdapter {
    private let paddingAdder: PaddingAdder
    private let frameConfiguration: ID3FrameConfiguration
    
    init(paddingAdder: PaddingAdder, frameConfiguration: ID3FrameConfiguration) {
        self.paddingAdder = paddingAdder
        self.frameConfiguration = frameConfiguration
    }

    func encoding(for version: ID3Version) -> [UInt8] {
      return frameConfiguration.encodingByteFor(
        version: version, encoding: .utf16WithBOM)
    }

    func termination() -> [UInt8] {
      return Array<UInt8>(repeating: 0, count: 2)
    }

    func adapt(stringOnly string: String) -> [UInt8] {
        return [UInt8](string.data(using: .utf16) ?? Data())
    }
}
