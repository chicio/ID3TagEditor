//
//  ID3FrameFromStringContentCreatorTest.swift
//
//  Created by Nolaine Crusher on 03/31/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3FrameFromURLStringContentCreatorTest: XCTestCase {
    func testCreatorFrameFromURLStringContent() {
        let id3FrameFromURLStringContentCreator = ID3FrameFromURLStringContentCreator(
            frameContentSizeCalculator: ID3FrameContentSizeCalculator(
                uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapterUsingUnsafePointer(),
                synchsafeEncoder: SynchsafeIntegerEncoder()
            ),
            frameFlagsCreator: ID3FrameFlagsCreator()
        )

        let frameBytes = id3FrameFromURLStringContentCreator.createFrame(
                frameIdentifier: [0x22],
                version: .version3,
                content: "http://testurl.com"
        )

        XCTAssertEqual(frameBytes, [
            0x22,//identifier
            0x00, 0x00, 0x00, 0x12, // size
            0x00, 0x00, // version
            0x68, 0x74, 0x74, 0x70, 0x3a, 0x2f, 0x2f, 0x74, 0x65,
            0x73, 0x74, 0x75, 0x72, 0x6c, 0x2e, 0x63, 0x6f, 0x6d
            // http://testurl.com
            ]
        )
    }
}
