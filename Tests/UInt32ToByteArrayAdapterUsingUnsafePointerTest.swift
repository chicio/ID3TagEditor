//
//  Int32ToByteArrayAdapterUsingUnsafePointer.swift
//
//  Created by Fabrizio Duroni on 19/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class UInt32ToByteArrayAdapterUsingUnsafePointerTest: XCTestCase {
    let uInt32ToByteArrayAdapterUsingUnsafePointer = UInt32ToByteArrayAdapterUsingUnsafePointer()

    func testAdapt32BitUnsignedInteger() {
        XCTAssertEqual(
            uInt32ToByteArrayAdapterUsingUnsafePointer.adapt(uInt32: UInt32(0x11223344)),
            [0x11, 0x22, 0x33, 0x44]
        )
    }
}
