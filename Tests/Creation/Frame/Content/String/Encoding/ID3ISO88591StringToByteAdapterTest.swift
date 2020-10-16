//
//  ID3ISO88591StringToByteAdapterTest.swift
//
//  Created by Fabrizio Duroni on 27/04/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3ISO88591StringToByteAdapterTest: XCTestCase {
    private let ENCODING: [UInt8] = [0x00]
    private let STRING: [UInt8] = [0x3A, 0x3A, 0x61, 0x20, 0x73, 0x74,
                                   0x72, 0x69, 0x6E, 0x67, 0x3A, 0x3A, 0x0]

    func testEncodeStringToISO88591WithEncodingByte() {
        let adapter = ID3ISO88591StringToByteAdapter(paddingAdder: MockPaddingAdder(),
                                                     frameConfiguration: ID3FrameConfiguration())

        let bytes = adapter.adapt(string: "::a string::", for: .version3)

        XCTAssertEqual(bytes, ENCODING + STRING)
    }
}
