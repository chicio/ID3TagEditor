//
//  UInt32ToByteArrayAdapterUsingUnsafePointer.swift
//
//  Created by Fabrizio Duroni on 19/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class UInt32ToByteArrayAdapterUsingUnsafePointer: UInt32ToByteArrayAdapter {
    func adapt(uInt32: UInt32) -> [UInt8] {
        var currentUInt32 = uInt32
        let bytes = withUnsafePointer(to: &currentUInt32) {
            $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout<UInt32>.size) {
                Array(UnsafeBufferPointer(start: $0, count: MemoryLayout<UInt32>.size))
            }
        }
        return bytes.reversed()
    }
}
