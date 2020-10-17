//
//  ID3FramePartOfTotal.swift
//
//  Created by Fabrizio Duroni on 07/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A class used to represent an ID3 track/disc position in the original recordings frame  in the ID3 tag.
 */
public class ID3FramePartOfTotal: ID3Frame, Equatable, CustomDebugStringConvertible {
    /// The position of the track/disc.
    public var part: Int
    /// The total number of tracks/discs in recordings.
    public var total: Int?
    /// TrackPositionInSet description, useful for debug.
    public var debugDescription: String {
        return "\(part) of \(total != nil ? String(total!) : "-")"
    }

    /**
     Init an ID3 track position frame.

     - parameter part: the index of the track/disc.
     - parameter total: the total tracks/discs of the recordings.
     */
    public init(part: Int, total: Int?) {
        self.part = part
        self.total = total
    }

    /**
     Compare two TrackPositionInSet.

     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.

     - returns: true if the track positions values are the same, else false.
     */
    public static func == (lhs: ID3FramePartOfTotal, rhs: ID3FramePartOfTotal) -> Bool {
        return lhs.part == rhs.part && lhs.total == rhs.total
    }
}
