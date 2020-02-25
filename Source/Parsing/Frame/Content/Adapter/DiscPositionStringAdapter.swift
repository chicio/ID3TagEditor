//
//  DiscPositionStringAdapter.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol DiscPositionStringAdapter {
    func adapt(discPosition: String) -> ID3FrameDiscPosition
}
