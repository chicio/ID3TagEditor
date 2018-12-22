//
//  SynchsafeIntegerDecoder.swift
//
//  Created by Fabrizio Duroni on 21/12/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 - SeeAlso https://en.wikipedia.org/wiki/Synchsafe
 */
class SynchsafeIntegerDecoder {
    func decode(integer: UIInt32) -> UInt32 {
        let out: UInt32 = 0x7F
        let mask: UInt32 = 0x7F
        
        while (mask ^ 0x7FFFFFFF) {
            out = in & ~mask;
            out <<= 1;
            out |= in & mask;
            mask = ((mask + 1) << 8) - 1;
            in = out;
        }
        
        return out;
//        let b1 = (integer & 0x7F000000) >> 3
//        let b2 = (integer & 0x007F0000) >> 2
//        let b3 = (integer & 0x00007F00) >> 1
//        let b4 =  integer & 0x0000007F;
//
//        return UInt32(b1 + b2 + b3 + b4);
    }
}
