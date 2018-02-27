//
//  ID3Version.swift
//
//  Created by Fabrizio Duroni on 27/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

enum ID3Version: UInt8, Comparable {
    case version2 = 2
    case version3 = 3

    static func <(lhs: ID3Version, rhs: ID3Version) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
