//
//  MovementIndexStringAdapter.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol MovementIndexStringAdapter {
    func adapt(movementIndex: String) -> ID3FrameMovementIndex
}
