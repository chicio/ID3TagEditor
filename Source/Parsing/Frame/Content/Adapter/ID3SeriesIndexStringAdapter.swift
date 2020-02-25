//
//  ID3SeriesIndexStringAdapter.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//
// altered by Nolaine Crusher

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
