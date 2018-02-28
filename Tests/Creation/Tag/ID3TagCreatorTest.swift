//
//  ID3TagCreatorTest.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3TagCreatorTest: XCTestCase {
    func testNoValidFrameData() {
        let id3TagCreator = ID3TagCreator(
                id3FrameCreatorsChain: MockID3FrameCreatorsChain(),
                uInt32ToByteArrayAdapter: MockUInt32ToByteArrayAdapter(),
                id3TagConfiguration: ID3TagConfiguration()
        )

        XCTAssertThrowsError(try id3TagCreator.create(id3Tag: ID3Tag(version: .version3, size: 0)))
    }

    func testTagTooBig() {
        let id3TagCreator = ID3TagCreator(
                id3FrameCreatorsChain: MockID3FrameCreatorsChain(frames: [UInt8](repeating: 0x0, count: 0xFFFFFFF)),
                uInt32ToByteArrayAdapter: MockUInt32ToByteArrayAdapter(),
                id3TagConfiguration: ID3TagConfiguration()
        )

        XCTAssertThrowsError(try id3TagCreator.create(id3Tag: ID3Tag(version: .version3, size: 0)))
    }

    func testGenerateValidData() {
        let id3TagCreator = ID3TagCreator(
                id3FrameCreatorsChain: MockID3FrameCreatorsChain(frames: [0x22, 0x33]),
                uInt32ToByteArrayAdapter: MockUInt32ToByteArrayAdapter(),
                id3TagConfiguration: ID3TagConfiguration()
        )
        XCTAssertEqual(
                try! id3TagCreator.create(id3Tag: ID3Tag(version: .version3, size: 2)),
                Data(bytes: ID3TagConfiguration().headerFor(version: .version3)
                        + [0x3, 0x2, 0x22, 0x33] + [UInt8](repeating: 0x0, count: 2048)
                )
        )
    }
}
