//
//  ID3FrameFromStringContentCreatorTest.swift
//
//  Created by Fabrizio Duroni on 28/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3FrameFromStringContentCreatorTest: XCTestCase {
    func testCreatorFrameFromStringContent() {
        let id3FrameFromStringContentCreator = ID3FrameFromStringContentCreator(
                frameHeaderCreator: MockFrameHeaderCreator(),
                stringToBytesAdapter: MockStringToBytesAdapter()
        )

        let frameBytes = id3FrameFromStringContentCreator.createFrame(
                frameType: .title,
                version: .version3,
                content: "test"
        )

        XCTAssertEqual(frameBytes, [0x01, 0x02] + "test".utf16ToBytes)
    }

    static let allTests = [
        ("testCreatorFrameFromStringContent", testCreatorFrameFromStringContent)
    ]
}
