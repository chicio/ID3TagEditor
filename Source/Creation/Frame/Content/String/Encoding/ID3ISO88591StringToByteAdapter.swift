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

    func encoding(for version: ID3Version) -> [UInt8] {
      return frameConfiguration.encodingByteFor(
        version: version, encoding: .isoLatin1)
    }

    func termination() -> [UInt8] {
      return [UInt8](repeating: 0, count: 1)
    }

    func adapt(stringOnly string: String) -> [UInt8] {
      #warning("Shouldn’t this throw instead?")
      // If the string is not actually representable in ISO 8859‐1, falling back to UTF‐8 enables any ASCII portions to remain legible, but will garble anything else. (It will be “valid” gibberish.)
      return string.data(using: .isoLatin1).map({ [UInt8]($0) })
        ?? [UInt8](string.utf8)
    }
}
