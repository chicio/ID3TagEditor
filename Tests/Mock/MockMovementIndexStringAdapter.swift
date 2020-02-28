//
//  MockMovementIndexStringAdapter.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockMovementIndexStringAdapter: ItunesMovementIndexStringAdapter {
    func adapt(movementIndex: String) -> ID3FrameItunesMovementIndex {
        return ID3FrameItunesMovementIndex(index: 6, totalMovements: 13)
    }
}
