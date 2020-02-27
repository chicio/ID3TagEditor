//
//  MockSeriesIndexStringAdapter.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockSeriesIndexStringAdapter: SeriesIndexStringAdapter {
    func adapt(seriesIndex: String) -> ID3FrameSeriesIndex {
        return ID3FrameSeriesIndex(index: 11, totalBooks: 19)
    }
}
