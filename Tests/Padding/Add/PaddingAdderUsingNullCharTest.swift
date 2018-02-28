//
//  PaddingAdderUsingNullCharTest.swift
//
//  Created by Fabrizio Duroni on 28/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class PaddingAdderUsingNullCharTest: XCTestCase {
    func testAddPadding() {
        let paddingAdderUsingNullChar = PaddingAdderUsingNullChar()

        let contentWithPadding = paddingAdderUsingNullChar.addTo(content: [0x1, 0x1])

        XCTAssertEqual(contentWithPadding, [0x0, 0x1, 0x1, 0x0])
    }
}
