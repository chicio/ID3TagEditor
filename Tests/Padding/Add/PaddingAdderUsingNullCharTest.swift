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
        let paddingAdderUsingNullChar = PaddingAdderToEndOfContentUsingNullChar()

        let contentWithPadding = paddingAdderUsingNullChar.addTo(content: [0x1, 0x1], numberOfByte: 1)

        XCTAssertEqual(contentWithPadding, [0x1, 0x1, 0x0])
    }
}
