//
//  ID3DiscPositionStringAdapterTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct ID3DiscPositionStringAdapterTest {
    @Test func testAdaptDiscPositionWithTotalDiscs() {
        let discPosition = ID3PartOfTotalStringAdapter().adapt(partOfTotal: "1/3")

        #expect(discPosition.part == 1)
        #expect(discPosition.total == 3)
    }

    @Test func testAdaptDiscPositionWithoutTotalDiscs() {
        let discPosition = ID3PartOfTotalStringAdapter().adapt(partOfTotal: "1")

        #expect(discPosition.part == 1)
        #expect(discPosition.total == nil)
    }

    @Test func testAdaptNotANumberDiscPosition() {
        let discPosition = ID3PartOfTotalStringAdapter().adapt(partOfTotal: "::invalid::")

        #expect(discPosition.part == 0)
        #expect(discPosition.total == nil)
    }
}
