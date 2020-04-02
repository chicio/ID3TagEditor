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
    /// The role of the involved person, i.e. instrument, vocal part, or other involvement
    public var role: String
    /// The name (or comma-delimited names) of the person performing a particular role.
    public var person: String
    /// TrackPositionInSet description, useful for debug.
    public var debugDescription: String {
        return "\(role): \(person)"
    }
    
    /**
     Init an ID3 involved person and musician credits frame.
     
     - parameter role: the role of the involved person.
     - parameter person: the name (or comma-delimited names) of the person fulfilling a given role.
     */
    public init(role: String, person: String) {
        self.role = role
        self.person = person
    }
    
    /**
     Compare two roles.
     
     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.
     
     - returns: true if the track positions values are the same, else false.
     */
    public static func ==(lhs: ID3FrameCreditsList, rhs: ID3FrameCreditsList) -> Bool {
        return lhs.role == rhs.role
    }
}
