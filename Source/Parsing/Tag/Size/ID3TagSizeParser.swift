//
//  ID3TagSizeParser.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TagSizeParser: TagSizeParser {
    private let tagBytesOffset = 6;
    
    func parse(data: NSData) -> UInt32 {
        let size = (data.bytes + tagBytesOffset).assumingMemoryBound(to: UInt32.self).pointee.bigEndian
        let b1 = (size & 0x7F000000) >> 3
        let b2 = (size & 0x007F0000) >> 2
        let b3 = (size & 0x00007F00) >> 1
        let b4 =  size & 0x0000007F;
        
        return UInt32(b1 + b2 + b3 + b4);
    }
}
