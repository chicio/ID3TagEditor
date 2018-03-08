//
//  MockTrackPositionStringAdapter.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockTrackPositionStringAdapter: TrackPositionStringAdapter {
    func adapt(trackPosition: String) -> TrackPositionInSet {
        return TrackPositionInSet(position: 2, totalTracks: 9)
    }
}
