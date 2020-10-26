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
        let id3FramesCreator = ID3FramesCreator(id3FrameCreatorsChain: MockID3FrameCreatorsChain())
        let id3TagHeaderCreator = ID3TagHeaderCreator(uInt32ToByteArrayAdapter: MockUInt32ToByteArrayAdapter(),
                                                      id3TagConfiguration: ID3TagConfiguration())
        let id3TagCreator = ID3TagCreator(id3FramesCreator: id3FramesCreator, id3TagHeaderCreator: id3TagHeaderCreator)

        XCTAssertThrowsError(try id3TagCreator.create(id3Tag: ID32v3TagBuilder().build()))
    }

    func testTagTooBig() {
        let id3FrameCreatorChain = MockID3FrameCreatorsChain(frames: [UInt8](repeating: 0x0, count: 0xFFFFFFF))
        let id3FramesCreator = ID3FramesCreator(id3FrameCreatorsChain: id3FrameCreatorChain)
        let id3TagHeaderCreator = ID3TagHeaderCreator(uInt32ToByteArrayAdapter: MockUInt32ToByteArrayAdapter(),
                                                      id3TagConfiguration: ID3TagConfiguration())
        let id3TagCreator = ID3TagCreator(id3FramesCreator: id3FramesCreator, id3TagHeaderCreator: id3TagHeaderCreator)

        XCTAssertThrowsError(try id3TagCreator.create(id3Tag: ID32v3TagBuilder().build()))
    }

    func testGenerateValidData() {
        let id3FrameCreatorChain = MockID3FrameCreatorsChain(frames: [0x22, 0x33])
        let id3FramesCreator = ID3FramesCreator(id3FrameCreatorsChain: id3FrameCreatorChain)
        let id3TagHeaderCreator = ID3TagHeaderCreator(uInt32ToByteArrayAdapter: MockUInt32ToByteArrayAdapter(),
                                                      id3TagConfiguration: ID3TagConfiguration())
        let id3TagCreator = ID3TagCreator(id3FramesCreator: id3FramesCreator, id3TagHeaderCreator: id3TagHeaderCreator)

        XCTAssertEqual(
                try? id3TagCreator.create(id3Tag: ID32v3TagBuilder().build()),
                Data(ID3TagConfiguration().headerFor(version: .version3)
                        + [0x0, 0x3, 0x2, 0x22, 0x33] + [UInt8](repeating: 0x0, count: 2048)
                )
        )
    }

    static let allTests = [
        ("testGenerateValidData", testGenerateValidData),
        ("testNoValidFrameData", testNoValidFrameData),
        ("testTagTooBig", testTagTooBig)
    ]
}
