//
//  ID3FrameFlagsCreator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameFlagsCreator: FrameFlagsCreator {
    func createFor(version: UInt8) -> [UInt8] {
        if (version >= 3) {
            return [0, 0]
        } else {
            return []
        }
    }
}
