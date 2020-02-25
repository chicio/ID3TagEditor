//
//  SeriesIndexStringAdapter.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol SeriesIndexStringAdapter {
    func adapt(seriesIndex: String) -> ID3FrameSeriesIndex
}
