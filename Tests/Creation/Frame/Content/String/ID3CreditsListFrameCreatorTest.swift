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
            stringToBytesAdapter: ID3ISO88591StringToByteAdapter(
                paddingAdder: PaddingAdderToEndOfContentUsingNullChar(),
                frameConfiguration: ID3FrameConfiguration()
            )
        )
        
        let frameBytes = id3CreditsListFrameCreator.createFrame(
            frameIdentifier: [0x22],
            version: .version3,
            role: "Musician",
            person: "Musician Name")
        
        XCTAssertEqual(
            frameBytes,
            [
                0x22, // Identifier (See above.)
                0x00, 0x00, 0x00, 0x19, // Size
                0x00, 0x00, // Flags
                0x00, // UCS‐2
                0x4d, 0x75, 0x73, 0x69, 0x63, 0x69, 0x61, 0x6e, 0x00, 0x00, // “musician”
                0x4d, 0x75, 0x73, 0x69, 0x63, 0x69, 0x61, 0x6e, 0x20, 0x4e, 0x61, 0x6d, 0x65, 0x00,// “Musician Name”
            ]
        )
    }
}
