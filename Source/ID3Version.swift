//
//  ID3Version.swift
//
//  Created by Fabrizio Duroni on 27/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

public enum ID3Version: UInt8, Comparable {
    case version2 = 2
    case version3 = 3

    public static func <(lhs: ID3Version, rhs: ID3Version) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
