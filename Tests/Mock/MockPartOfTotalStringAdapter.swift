//
//  MockPartOfTotalStringAdapter.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockPartOfTotalStringAdapter: PartOfTotalStringAdapter {
    func adapt(partOfTotal: String) -> ID3FramePartOfTotal {
        return ID3FramePartOfTotal(part: 2, total: 9)
    }
}
