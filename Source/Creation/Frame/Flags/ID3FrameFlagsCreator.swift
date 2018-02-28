//
//  ID3FrameFlagsCreator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameFlagsCreator: FrameFlagsCreator {
    func createFor(version: ID3Version) -> [UInt8] {
        if (version >= ID3Version.version3) {
            return [0x0, 0x0]
        } else {
            return []
        }
    }
}
