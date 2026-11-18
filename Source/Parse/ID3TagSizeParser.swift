//
//  ID3TagSizeParser.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TagSizeParser: TagSizeParser {
    private let tagBytesOffset = 6

    func parse(data: Data) -> UInt32 {
        let tagSize = data.withUnsafeBytes { buffer in
            buffer.loadUnaligned(fromByteOffset: tagBytesOffset, as: UInt32.self).bigEndian
        }
        let decodedTagSize = SynchsafeIntegerDecoder().decode(integer: tagSize)
        return decodedTagSize
    }
}
