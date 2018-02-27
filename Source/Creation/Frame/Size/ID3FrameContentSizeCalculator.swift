//
//  ID3FrameContentSizeCalculator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameContentSizeCalculator: FrameContentSizeCalculator {
    private let uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapter

    init(uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapter) {
        self.uInt32ToByteArrayAdapter = uInt32ToByteArrayAdapter
    }

    func calculateSizeOf(content: [UInt8], version: ID3Version) -> [UInt8] {
        var size = uInt32ToByteArrayAdapter.adapt(uInt32: UInt32(content.count))
        if version2OrBelow(version: version) {
            size.removeFirst();
        }
        return size
    }

    private func version2OrBelow(version: ID3Version) -> Bool {
        return version <= ID3Version.version2
    }
}
