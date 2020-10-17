//
//  ID3Version.swift
//
//  Created by Fabrizio Duroni on 27/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 Enum that contains the version supported by ID3TagEditor.
 */
public enum ID3Version: UInt8, Comparable, Equatable, Hashable, CaseIterable {
    /// ID3 2.2 version.
    case version2 = 2
    /// ID3 2.3 version.
    case version3 = 3
    /// ID3 2.4 version.
    case version4 = 4

    /**
     Compare two version values.
     
     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.
     
     - returns: true if the version value are the same, else false.
     */
    public static func < (lhs: ID3Version, rhs: ID3Version) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
