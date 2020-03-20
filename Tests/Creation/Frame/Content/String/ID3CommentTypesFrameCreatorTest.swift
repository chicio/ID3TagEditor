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
          frameContentSizeCalculator: ID3FrameContentSizeCalculator(
            uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapterUsingUnsafePointer(),
            synchsafeEncoder: SynchsafeIntegerEncoder()
          ),
          frameFlagsCreator: ID3FrameFlagsCreator(),
          stringToBytesAdapter: ID3UTF16StringToByteAdapter(
            paddingAdder: PaddingAdderToEndOfContentUsingNullChar(),
            frameConfiguration: ID3FrameConfiguration()
          )
        )

        let frameBytes = id3CommentTypesFrameCreator.createFrame(
                frameIdentifier: [0x22],
                version: .version3,
                language: ISO_639_2_Codes.und,
                description: "description",
                content: "test"
        )

        XCTAssertEqual(
          frameBytes,
          [
            0x22, // Identifier (See above.)
            0x00, 0x00, 0x00, 0x28, // Size
            0x00, 0x00, // Flags
            0x01, // UCS‐2
            0x75, 0x6E, 0x64, // “und”
            0xFF, 0xFE, 0x64, 0x00, 0x65, 0x00, 0x73, 0x00, 0x63, 0x00, 0x72, 0x00, 0x69, 0x00, 0x70, 0x00, 0x74, 0x00, 0x69, 0x00, 0x6F, 0x00, 0x6E, 0x00, 0x00, 0x00, // “description”
            0xFF, 0xFE, 0x74, 0x00, 0x65, 0x00, 0x73, 0x00, 0x74, 0x00 // “test”
          ]
        )
    }
}
