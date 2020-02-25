//
//  MovementIndex.swift
//
//  OriginalCreated by Fabrizio Duroni on 07/03/2018.
//  2018 Fabrizio Duroni.
//
// this version altered to suit cataloging of audiobooks in
// multi-series chronologies
// by Nolaine Crusher on 02/19/2020

import Foundation

/**
 A class used to represent a movement index in a work.
 */
public class ID3FrameMovementIndex: ID3Frame, Equatable, CustomDebugStringConvertible {
    /// The index of the movement.
    public var index: Int
    /// The total number of movements in work.
    public var totalMovements: Int?
    /// movement index in work description, useful for debug.
    public var debugDescription: String {
        return "\(index) of \(totalMovements != nil ? String(totalMovements!) : "-")"
    }

    /**
     Init an ID3 movement index frame.

     - parameter index: the movement index.
     - parameter totalMovements: the total movements in the work.
     */
    public init(index: Int, totalMovements: Int?) {
        self.index = index
        self.totalMovements = totalMovements
    }

    /**
     Compare two movement indices.

     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.

     - returns: true if the movement index values are the same, else false.
     */
    public static func ==(lhs: ID3FrameMovementIndex, rhs: ID3FrameMovementIndex) -> Bool {
        return lhs.index == rhs.index && lhs.totalMovements == rhs.totalMovements
    }
}
