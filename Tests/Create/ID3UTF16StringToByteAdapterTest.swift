//
//  ID3UTF16StringToByteAdapterTest.swift
//
//  Created by Fabrizio Duroni on 27/04/2018.
//  2018 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct ID3UTF16StringToByteAdapterTest {
    private let ENCODING: [UInt8] = [0x01]
    private let BOM: [UInt8] = [0xFF, 0xFE]
    private let STRING: [UInt8] = [0x3A, 0x0, 0x3A, 0x0, 0x61, 0x0, 0x20, 0x0, 0x73, 0x0, 0x74, 0x0,
                                   0x72, 0x0, 0x69, 0x0, 0x6E, 0x0, 0x67, 0x0, 0x3A, 0x0, 0x3A, 0x0, 0x0]

    @Test func testEncodeStringToUTF16WithEncodingByte() {
        let adapter = ID3UTF16StringToByteAdapter(paddingAdder: MockPaddingAdder(),
                                                  frameConfiguration: ID3FrameConfiguration())

        let bytes = adapter.adapt(string: "::a string::", for: .version3)

        #expect(bytes == ENCODING + BOM + STRING)
    }
}
