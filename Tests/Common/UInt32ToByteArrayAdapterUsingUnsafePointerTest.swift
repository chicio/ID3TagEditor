//
//  Int32ToByteArrayAdapterUsingUnsafePointerTest.swift
//
//  Created by Fabrizio Duroni on 19/02/2018.
//  2018 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct UInt32ToByteArrayAdapterUsingUnsafePointerTest {
    @Test func testAdapt32BitUnsignedInteger() {
        #expect(
            UInt32ToByteArrayAdapterUsingUnsafePointer().adapt(uInt32: UInt32(0x11223344)) ==
            [0x11, 0x22, 0x33, 0x44]
        )
    }
}
