//
//  ID3SeriesIndexStringAdapter.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3SeriesIndexStringAdapter: SeriesIndexStringAdapter {
    func adapt(seriesIndex: String) -> ID3FrameSeriesIndex {
        let seriesIndexComponents = seriesIndex.components(separatedBy: "/")
        let seriesIndex = getSeriesIndexFrom(seriesIndexComponents: seriesIndexComponents)
        let totalBooks = getTotalBooksFrom(seriesIndexComponents: seriesIndexComponents)
        return ID3FrameSeriesIndex(index: seriesIndex, totalBooks: totalBooks)
    }

    private func getSeriesIndexFrom(seriesIndexComponents: [String]) -> Int {
        return Int(seriesIndexComponents[0]) ?? 0
    }

    private func getTotalBooksFrom(seriesIndexComponents: [String]) -> Int? {
        return seriesIndexComponents.count > 1 ? Int(seriesIndexComponents[1]) : nil
    }
}
