//
//  MockMovementIndexStringAdapter.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockMovementIndexStringAdapter: MovementIndexStringAdapter {
    func adapt(movementIndex: String) -> ID3FrameMovementIndex {
        return ID3FrameMovementIndex(index: 6, totalMovements: 13)
    }
}
