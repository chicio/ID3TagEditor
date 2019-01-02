//
//  TrackPositionStringAdapter.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol TrackPositionStringAdapter {
    func adapt(trackPosition: String) -> ID3FrameTrackPosition
}
