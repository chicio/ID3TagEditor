//
//  MovementIndexStringAdapter.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol MovementIndexStringAdapter {
    func adapt(movementIndex: String) -> ID3FrameMovementIndex
}
