//
//  ID3DiscPositionStringAdapterTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3DiscPositionStringAdapterTest: XCTestCase {
    let discPositionStringAdapter = ID3DiscPositionStringAdapter()

    func testAdaptDiscPositionWithTotalDiscs() {
        let discPosition = discPositionStringAdapter.adapt(discPosition: "1/3")

        XCTAssertEqual(discPosition.position, 1)
        XCTAssertEqual(discPosition.totalDiscs, 3)
    }

    func testAdaptDiscPositionWithoutTotalDiscs() {
        let discPosition = discPositionStringAdapter.adapt(discPosition: "1")

        XCTAssertEqual(discPosition.position, 1)
        XCTAssertNil(discPosition.totalDiscs)
    }

    func testAdaptNotANumberDiscPosition() {
        let discPosition = discPositionStringAdapter.adapt(discPosition: "::invalid::")

        XCTAssertEqual(discPosition.position, 0)
        XCTAssertNil(discPosition.totalDiscs)
    }
}
