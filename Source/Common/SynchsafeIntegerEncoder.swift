//
//  SynchsafeIntegerEncoder.swift
//
//  Created by Fabrizio Duroni on 22/12/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 Synchsafe integer encoder
 
 - SeeAlso https://handwiki.org/wiki/Synchsafe
 */
class SynchsafeIntegerEncoder: SynchsafeEncoder {
    func encode(integer: UInt32) -> UInt32 {
        var encodedInteger: UInt32 = 0
        var mask: UInt32 = 0x7F
        var partiallyEncodedInteger = integer
        while mask != 0x7FFFFFFF {
            encodedInteger = partiallyEncodedInteger & ~mask
            encodedInteger = encodedInteger << 1
            encodedInteger = encodedInteger | partiallyEncodedInteger & mask
            mask = ((mask + 1) << 8) - 1
            partiallyEncodedInteger = encodedInteger
        }
        return encodedInteger
    }
}
