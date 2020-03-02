//
//  ID3DiscPositionStringAdapterTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3DiscPositionStringAdapterTest: XCTestCase {
    let discPositionStringAdapter = ID3PartOfTotalStringAdapter()

    func testAdaptDiscPositionWithTotalDiscs() {
        let discPosition = discPositionStringAdapter.adapt(partOfTotal: "1/3")

        XCTAssertEqual(discPosition.part, 1)
        XCTAssertEqual(discPosition.total, 3)
    }

    func testAdaptDiscPositionWithoutTotalDiscs() {
        let discPosition = discPositionStringAdapter.adapt(partOfTotal: "1")

        XCTAssertEqual(discPosition.part, 1)
        XCTAssertNil(discPosition.total)
    }

    func testAdaptNotANumberDiscPosition() {
        let discPosition = discPositionStringAdapter.adapt(partOfTotal: "::invalid::")

        XCTAssertEqual(discPosition.part, 0)
        XCTAssertNil(discPosition.total)
    }
}
