//
//  TrackPositionStringAdapter.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol PartOfTotalStringAdapter {
    func adapt(partOfTotal: String) -> ID3FramePartOfTotal
}
