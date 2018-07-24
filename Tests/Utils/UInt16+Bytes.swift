//
//  String+utf16Bytes.swift
//
//  Created by Fabrizio Duroni on 24/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

extension UInt16 {
    var toBytes: [UInt8] {
        var currentNumber = self
        let count = MemoryLayout<UInt16>.size
        let bytePtr = withUnsafePointer(to: &currentNumber) {
            $0.withMemoryRebound(to: UInt8.self, capacity: count) {
                UnsafeBufferPointer(start: $0, count: count)
            }
        }
        return [UInt8](bytePtr)
    }
}
