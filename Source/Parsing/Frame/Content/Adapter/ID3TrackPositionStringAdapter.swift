//
//  ID3TrackPositionStringAdapter.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TrackPositionStringAdapter: TrackPositionStringAdapter {
    func adapt(trackPosition: String) -> TrackPositionInSet {
        let trackPositionComponents = trackPosition.components(separatedBy: "/")
        let trackPosition = getTrackPositionFrom(trackPositionComponents: trackPositionComponents)
        let totalTracks = getTotalTracksFrom(trackPositionComponents: trackPositionComponents)
        return TrackPositionInSet(position: trackPosition, totalTracks: totalTracks)
    }

    private func getTrackPositionFrom(trackPositionComponents: [String]) -> Int {
        return Int(trackPositionComponents[0]) ?? 0
    }

    private func getTotalTracksFrom(trackPositionComponents: [String]) -> Int? {
        return trackPositionComponents.count > 1 ? Int(trackPositionComponents[1]) : nil
    }
}
