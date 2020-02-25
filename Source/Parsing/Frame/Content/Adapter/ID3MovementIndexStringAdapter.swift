//
//  ID3MovementIndexStringAdapter.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//
// altered by Nolaine Crusher

import Foundation

class ID3MovementIndexStringAdapter: MovementIndexStringAdapter {
    func adapt(movementIndex: String) -> ID3FrameMovementIndex {
        let movementIndexComponents = movementIndex.components(separatedBy: "/")
        let movementIndex = getMovementIndexFrom(movementIndexComponents: movementIndexComponents)
        let totalMovements = getTotalMovementsFrom(movementIndexComponents: movementIndexComponents)
        return ID3FrameMovementIndex(index: movementIndex, totalMovements: totalMovements)
    }

    private func getMovementIndexFrom(movementIndexComponents: [String]) -> Int {
        return Int(movementIndexComponents[0]) ?? 0
    }

    private func getTotalMovementsFrom(movementIndexComponents: [String]) -> Int? {
        return movementIndexComponents.count > 1 ? Int(movementIndexComponents[1]) : nil
    }
}
