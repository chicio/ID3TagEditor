//
//  ID3FrameContentSizeCalculator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameContentSizeCalculator: FrameContentSizeCalculator {
    private let uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapter
    private let synchsafeEncoder: SynchsafeEncoder

    init(uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapter, synchsafeEncoder: SynchsafeEncoder) {
        self.uInt32ToByteArrayAdapter = uInt32ToByteArrayAdapter
        self.synchsafeEncoder = synchsafeEncoder
    }

    func calculateSizeOf(content: [UInt8], version: ID3Version) -> [UInt8] {
        let size = synchsafeEncodeIfVersion4(size: UInt32(content.count), version: version)
        var sizeBytes = uInt32ToByteArrayAdapter.adapt(uInt32: size)
        sizeBytes = removeFirstByteIfVersion2From(size: sizeBytes, version: version)
        return sizeBytes
    }

    private func synchsafeEncodeIfVersion4(size: UInt32, version: ID3Version) -> UInt32 {
        if version == .version4 {
            return synchsafeEncoder.encode(integer: size)
        }
        return size
    }

    private func removeFirstByteIfVersion2From(size: [UInt8], version: ID3Version) -> [UInt8] {
        var newSize = size
        if version <= .version2 {
            newSize.removeFirst()
        }
        return newSize
    }
}
