//
//  DiscPositionStringAdapter.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol DiscPositionStringAdapter {
    func adapt(discPosition: String) -> ID3FrameDiscPosition
}
