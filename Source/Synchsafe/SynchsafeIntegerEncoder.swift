//
//  SynchsafeIntegerEncoder.swift
//
//  Created by Fabrizio Duroni on 22/12/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 Synchsafe integer encoder
 
 - SeeAlso https://en.wikipedia.org/wiki/Synchsafe
 */
class SynchsafeIntegerEncoder {
    func encode(integer: Int) -> Int {
        var out: Int = 0
        var mask: Int = 0x7F
        var currentValue = integer
        while (mask != 0x7FFFFFFF) {
            out = currentValue & ~mask
            out = out << 1
            out = out | currentValue & mask
            mask = ((mask + 1) << 8) - 1
            currentValue = out
        }
        return out
    }
}
