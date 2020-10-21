//
//  Int32ToByteArrayAdapterUsingUnsafePointerTest.swift
//
//  Created by Fabrizio Duroni on 19/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class UInt32ToByteArrayAdapterUsingUnsafePointerTest: XCTestCase {
    func testAdapt32BitUnsignedInteger() {
        XCTAssertEqual(
            UInt32ToByteArrayAdapterUsingUnsafePointer().adapt(uInt32: UInt32(0x11223344)),
            [0x11, 0x22, 0x33, 0x44]
        )
    }

    static let allTests = [
        ("testAdapt32BitUnsignedInteger", testAdapt32BitUnsignedInteger)
    ]
}
