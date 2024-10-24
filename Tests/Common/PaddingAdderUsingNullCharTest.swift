//
//  PaddingAdderUsingNullCharTest.swift
//
//  Created by Fabrizio Duroni on 28/02/2018.
//  2018 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct PaddingAdderUsingNullCharTest {
    @Test func testAddPadding() {
        let paddingAdderUsingNullChar = PaddingAdderToEndOfContentUsingNullChar()

        let contentWithPadding = paddingAdderUsingNullChar.addTo(content: [0x1, 0x1], numberOfByte: 1)

        #expect(contentWithPadding == [0x1, 0x1, 0x0])
    }
}
