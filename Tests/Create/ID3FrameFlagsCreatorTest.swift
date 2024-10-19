//
//  ID3FrameFlagsCreatorTest.swift
//
//  Created by Fabrizio Duroni on 28/02/2018.
//  2018 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct ID3FrameFlagsCreatorTest {
    @Test func testFlagsForVersion3() {
        #expect(ID3FrameFlagsCreator().createFor(version: .version3) == [0x0, 0x0])
    }

    @Test func testFlagsForVersion2() {
        #expect(ID3FrameFlagsCreator().createFor(version: .version2) == [])
    }
}
