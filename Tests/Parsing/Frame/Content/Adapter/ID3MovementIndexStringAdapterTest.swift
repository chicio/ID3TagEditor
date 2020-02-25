//
//  ID3MovementIndexStringAdapterTest.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3MovementIndexStringAdapterTest: XCTestCase {
    let movementIndexStringAdapter = ID3MovementIndexStringAdapter()

    func testAdaptMovementIndexWithTotalMovements() {
        let movementIndex = movementIndexStringAdapter.adapt(movementIndex: "6/13")

        XCTAssertEqual(movementIndex.index, 6)
        XCTAssertEqual(movementIndex.totalMovements, 13)
    }

    func testAdaptMovementIndexWithoutTotalMovements() {
        let movementIndex = movementIndexStringAdapter.adapt(movementIndex: "5")

        XCTAssertEqual(movementIndex.index, 5)
        XCTAssertNil(movementIndex.totalMovements)
    }

    func testAdaptNotANumberMovementIndex() {
        let movementIndex = movementIndexStringAdapter.adapt(movementIndex: "::invalid::")

        XCTAssertEqual(movementIndex.index, 0)
        XCTAssertNil(movementIndex.totalMovements)
    }
}
