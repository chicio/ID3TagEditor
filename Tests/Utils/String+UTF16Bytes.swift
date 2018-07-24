//
//  String+utf16Bytes.swift
//
//  Created by Fabrizio Duroni on 24/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

extension String {
    var utf16ToBytes: [UInt8] {
        return self.utf16.reduce([]) { (a, current) -> [UInt8] in
            return a + current.toBytes
        }
    }
}
