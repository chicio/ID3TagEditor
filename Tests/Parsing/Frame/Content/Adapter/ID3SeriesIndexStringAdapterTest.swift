//
//  ID3SeriesIndexStringAdapterTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3SeriesIndexStringAdapterTest: XCTestCase {
    let seriesIndexStringAdapter = ID3SeriesIndexStringAdapter()

    func testAdaptSeriesIndexWithTotalBooks() {
        let seriesIndex = seriesIndexStringAdapter.adapt(seriesIndex: "11/19")

        XCTAssertEqual(seriesIndex.index, 11)
        XCTAssertEqual(seriesIndex.totalBooks, 19)
    }

    func testAdaptSeriesIndexWithoutTotalBooks() {
        let seriesIndex = seriesIndexStringAdapter.adapt(seriesIndex: "9")

        XCTAssertEqual(seriesIndex.index, 9)
        XCTAssertNil(seriesIndex.totalBooks)
    }

    func testAdaptNotANumberSeriesIndex() {
        let seriesIndex = seriesIndexStringAdapter.adapt(seriesIndex: "::invalid::")

        XCTAssertEqual(seriesIndex.index, 0)
        XCTAssertNil(seriesIndex.totalBooks)
    }
}
