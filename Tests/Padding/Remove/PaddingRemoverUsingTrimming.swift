//
//  PaddingRemoverUsingTrimming.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class PaddingRemoverUsingTrimmingTest: XCTestCase {
    func testRemovePadding() {
        XCTAssertEqual(
                "simple string",
                PaddingRemoverUsingTrimming().removeFrom(string: "\0\0\0simple string\0\0\0")
        )
    }

    static let allTests = [
        ("testRemovePadding", testRemovePadding)
    ]
}
