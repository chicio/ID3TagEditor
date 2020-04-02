//
//  ID3CreditsListFrameCreatorTest.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 4/2/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import XCTest
@testable import ID3TagEditor

class ID3CreditsListFrameCreatorTest: XCTestCase {
    func testCreatorFrameCreditsList() {
        let id3CreditsListFrameCreator = ID3CreditsListFrameCreator(
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
        
        let frameBytes = id3CreditsListFrameCreator.createFrame(
            frameIdentifier: [0x22],
            version: .version3,
            role: "musician",
            person: "Musician Name")
        
        XCTAssertEqual(
            frameBytes,
            [
                0x22, // Identifier (See above.)
                0x00, 0x00, 0x00, 0x34, // Size
                0x00, 0x00, // Flags
                0x01, // UCS‐2
                0x6d, 0x75, 0x73, 0x69, 0x63, 0x69, 0x61, 0x6e, 0x00, // “musician”
                0x4d, 0x75, 0x73, 0x69, 0x63, 0x69, 0x61, 0x6e, 0x20, 0x4e, 0x61, 0x6d, 0x65, 0x00,// “Musician Name”
            ]
        )
    }
}

/* XCTAssertEqual failed: ("[
 34, (identifier)
 0, 0, 0, 52, (size)
 0, 0, (flags)
 1, (encoding?)
 255, 254, 109, 0, (what are these?)
 117, 0, 115, 0, 105, 0, 99, 0, 105, 0, 97, 0, 110, (Musician)
 0, (termination)
 0, 0, 1, (another flag and encoding?)
 255, 254, 77, 0, (???)
 117, 0, 115, 0, 105, 0, 99, 0, 105, 0, 97, 0, 110, 0, 32, 0, 78, 0, 97, 0, 109, 0, 101, 0, 0, 0
 ]") is not equal to ("[34, 0, 0, 0, 52, 0, 0, 1, 109, 117, 115, 105, 99, 105, 97, 110, 0, 77, 117, 115, 105, 99, 105, 97, 110, 32, 78, 97, 109, 101, 0]")
 why is it including a zero between every character */
