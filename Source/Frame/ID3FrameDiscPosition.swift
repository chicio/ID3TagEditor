//
//  DiscPositionInSet.swift
//
//  Original Created by Fabrizio Duroni on 07/03/2018.
//  2018 Fabrizio Duroni.
//
// This version added by Nolaine Crusher on 02/19/2020

import Foundation

/**
 A class used to represent an ID3 disc position in the original recordings frame in the ID3 tag.
 */
public class ID3FrameDiscPosition: ID3Frame, Equatable, CustomDebugStringConvertible {
    /// The position of the disc.
    public var position: Int
    /// The total number of discs in the set.
    public var totalDiscs: Int?
    /// DiscPositionInSet description, useful for debug.
    public var debugDescription: String {
        return "\(position) of \(totalDiscs != nil ? String(totalDiscs!) : "-")"
    }

    /**
     Init an ID3 disc position frame.

     - parameter position: the disc position.
     - parameter totalDiscs: the total discs of the set.
     */
    public init(position: Int, totalDiscs: Int?) {
        self.position = position
        self.totalDiscs = totalDiscs
    }

    /**
     Compare two DiscPositionInSet.

     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.

     - returns: true if the disc positions values are the same, else false.
     */
    public static func ==(lhs: ID3FrameDiscPosition, rhs: ID3FrameDiscPosition) -> Bool {
        return lhs.position == rhs.position && lhs.totalDiscs == rhs.totalDiscs
    }
}
