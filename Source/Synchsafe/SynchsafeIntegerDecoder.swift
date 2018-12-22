//
//  SynchsafeIntegerDecoder.swift
//
//  Created by Fabrizio Duroni on 21/12/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 Synchsafe integer decoder
 
 - SeeAlso https://en.wikipedia.org/wiki/Synchsafe
 */
class SynchsafeIntegerDecoder {
    func decode(integer: UInt32) -> UInt32 {
        var decodedInteger: UInt32 = 0
        var mask: UInt32 = 0x7F000000;
        
        while (mask != 0) {
            decodedInteger = decodedInteger >> 1;
            decodedInteger = decodedInteger | integer & mask;
            mask >>= 8;
        }
        
        return decodedInteger;
//        let b1 = (integer & 0x7F000000) >> 3
//        let b2 = (integer & 0x007F0000) >> 2
//        let b3 = (integer & 0x00007F00) >> 1
//        let b4 =  integer & 0x0000007F;
//
//        return UInt32(b1 + b2 + b3 + b4);
    }
}
