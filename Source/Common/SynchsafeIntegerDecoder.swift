//
//  SynchsafeIntegerDecoder.swift
//
//  Created by Fabrizio Duroni on 21/12/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 Synchsafe integer decoder
 
 - SeeAlso https://handwiki.org/wiki/Synchsafe
 */
class SynchsafeIntegerDecoder {
    func decode(integer: UInt32) -> UInt32 {
        var decodedInteger: UInt32 = 0
        var mask: UInt32 = 0x7F000000

        while mask != 0 {
            decodedInteger = decodedInteger >> 1
            decodedInteger = decodedInteger | integer & mask
            mask >>= 8
        }

        return decodedInteger
    }
}
