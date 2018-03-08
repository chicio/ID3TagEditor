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
public class TrackPositionInSet {
    /// The position of the track.
    var position: Int
    /// The total number of tracks in recordings.
    var totalTracks: Int?

    /**
     Init a track position.

     - parameter position: the track position.
     - parameter totalTracks: the total tracks of the recordings.
     */
    public init(position: Int, totalTracks: Int?) {
        self.position = position
        self.totalTracks = totalTracks
    }
}
