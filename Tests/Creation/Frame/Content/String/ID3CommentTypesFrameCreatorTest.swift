//
//  ID3CommentTypesFrameCreatorTest.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/13/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import XCTest
@testable import ID3TagEditor

class ID3CommentTypesFrameCreatorTest: XCTestCase {
    func testCreatorFrameFromStringContent() {
        let id3CommentTypesFrameCreator = ID3CommentTypesFrameCreator(
                frameContentSizeCalculator: MockFrameContentSizeCalculator(),
                frameFlagsCreator: MockFrameFlagsCreator(),
                stringToBytesAdapter: MockStringToBytesAdapter()
        )

        let frameBytes = id3CommentTypesFrameCreator.createFrame(
                frameIdentifier: [0x22],
                version: .version3,
                language: ISO_639_2_Codes.und,
                description: "description",
                content: "test"
        )

        #warning("this is going to fail because I don't know how to adapt it for the new type")
        XCTAssertEqual(frameBytes, [0x22, 0x11, 0x00, /* insert .und in bytes*/ /* insert "description in bytes followed by a null character*/ 0x01, 0x00, 0x00, 0x74, 0x65, 0x73, 0x74, 0x00, 0x00])
    }
}

class MockCommentTypesStringToBytesAdapter: StringToBytesAdapter {
    func adapt(string: String, for version: ID3Version) -> [UInt8] {
        return [0x01, 0x00, 0x00, 0x74, 0x65, 0x73, 0x74, 0x00, 0x00]
    }
}
