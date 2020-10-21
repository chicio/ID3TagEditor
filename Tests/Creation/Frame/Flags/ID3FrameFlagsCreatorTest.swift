//
//  ID3FrameFlagsCreatorTest.swift
//
//  Created by Fabrizio Duroni on 28/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3FrameFlagsCreatorTest: XCTestCase {
    private let id3FrameFlagsCreator = ID3FrameFlagsCreator()

    func testFlagsForVersion3() {
        XCTAssertEqual(id3FrameFlagsCreator.createFor(version: .version3), [0x0, 0x0])
    }

    func testFlagsForVersion2() {
        XCTAssertEqual(id3FrameFlagsCreator.createFor(version: .version2), [])
    }

    static let allTests = [
        ("testFlagsForVersion2", testFlagsForVersion2),
        ("testFlagsForVersion3", testFlagsForVersion3)
    ]
}
