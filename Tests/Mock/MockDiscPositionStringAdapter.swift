//
//  MockDiscPositionStringAdapter.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockDiscPositionStringAdapter: DiscPositionStringAdapter {
    func adapt(discPosition: String) -> ID3FrameDiscPosition {
        return ID3FrameDiscPosition(position: 1, totalDiscs: 3)
    }
}
