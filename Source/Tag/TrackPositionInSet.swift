//
//  TrackPositionInSet.swift
//
//  Created by Fabrizio Duroni on 07/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A class used to represent the track position in the original recordings for the ID3 tag.
 */
public struct TrackPositionInSet: Equatable {
    /// The position of the track.
    public var position: Int
    /// The total number of tracks in recordings.
    public var totalTracks: Int?

    /**
     Init a track position.

     - parameter position: the track position.
     - parameter totalTracks: the total tracks of the recordings.
     */
    public init(position: Int, totalTracks: Int?) {
        self.position = position
        self.totalTracks = totalTracks
    }

    /**
     Compare two TrackPositionInSet.

     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.

     - returns: true if the track positions values are the same, else false.
     */
    public static func ==(lhs: TrackPositionInSet, rhs: TrackPositionInSet) -> Bool {
        return lhs.position == rhs.position && lhs.totalTracks == rhs.totalTracks
    }
}
