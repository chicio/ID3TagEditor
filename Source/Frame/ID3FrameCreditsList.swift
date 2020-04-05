//
//  ID3FrameCreditsList.swift
//
//  Created by Nolaine Crusher 4/1/20
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A class used to represent an ID3 involved peeople list or musician credits frame.
 */
public class ID3FrameCreditsList: ID3Frame, Equatable, CustomDebugStringConvertible {
    /// An array of the role:person tuples
    public var entries: [(role: String, person: String)]
    /// CreditsList description, useful for debug.
    public var debugDescription: String {
        return "\(entries)"
    }
    
    /**
     Init an ID3 involved person and musician credits frame.
     - parameter entries: the array of `role`:`person` pairs
     - parameter role: the role of the involved person.
     - parameter person: the name (or comma-delimited names) of the person fulfilling a given role.
     */
    public init(entries: [(role: String, person: String)]) {
        self.entries = entries
    }
    
    /**
     Compare two entries.
     
     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.
     
     - returns: true if the entries are the same, else false.
     */
    public static func == (lhs: ID3FrameCreditsList, rhs: ID3FrameCreditsList) -> Bool {
        return lhs.entries.elementsEqual(rhs.entries, by: { $0 == $1 })
    }
}
