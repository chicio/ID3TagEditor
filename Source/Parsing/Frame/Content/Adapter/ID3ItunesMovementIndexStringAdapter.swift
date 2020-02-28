//
//  ID3ItunesMovementIndexStringAdapter.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3ItunesMovementIndexStringAdapter: ItunesMovementIndexStringAdapter {
    func adapt(movementIndex: String) -> ID3FrameItunesMovementIndex {
        let movementIndexComponents = movementIndex.components(separatedBy: "/")
        let movementIndex = getMovementIndexFrom(movementIndexComponents: movementIndexComponents)
        let totalMovements = getTotalMovementsFrom(movementIndexComponents: movementIndexComponents)
        return ID3FrameItunesMovementIndex(index: movementIndex, totalMovements: totalMovements)
    }

    private func getMovementIndexFrom(movementIndexComponents: [String]) -> Int {
        return Int(movementIndexComponents[0]) ?? 0
    }

    private func getTotalMovementsFrom(movementIndexComponents: [String]) -> Int? {
        return movementIndexComponents.count > 1 ? Int(movementIndexComponents[1]) : nil
    }
}
