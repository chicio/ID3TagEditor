//
//  ID3UserDefinedTextInformationFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3UserDefinedTextInformationFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoUserDefinedText() {
        let tagBytes: [UInt8] = [1, 1, 1]

        let id3UserTextFrameCreator = ID3UserDefinedTextInformationFrameCreator(
            frameCreator:
              ID3CommentTypesFrameCreator(
                frameContentSizeCalculator: MockFrameContentSizeCalculator(),
                frameFlagsCreator: MockFrameFlagsCreator(),
                stringToBytesAdapter: MockStringToBytesAdapter()
              ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3UserTextFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)
        
        XCTAssertEqual(newTagBytes, tagBytes)
    }
    
    func testFrameCreationWhenThereIsUserDefinedText() {
        let newFrameBytes: [UInt8] = [
          0x54, 0x58, 0x58, 0x58, // TXXX
          0x11, // Size (see MockFrameContentSizeCalculator)
          0x00, // Flags (see MockFrameFlagsCreator
          0x00, // Latin‐1
          0x74, 0x65, 0x73, 0x74, 0x00, // test
          0x74, 0x65, 0x78, 0x74 // text
        ]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.UserDefinedTextInformation: ID3FrameUserDefinedText(description: "test", content: "text")]
        )
        let configuration = ID3FrameConfiguration()
        let id3UserTextFrameCreator = ID3UserDefinedTextInformationFrameCreator(
            frameCreator:
              ID3CommentTypesFrameCreator(
                frameContentSizeCalculator: MockFrameContentSizeCalculator(),
                frameFlagsCreator: MockFrameFlagsCreator(),
                stringToBytesAdapter: ID3ISO88591StringToByteAdapter(
                  paddingAdder: MockPaddingAdder(),
                  frameConfiguration: configuration
                )
            ),
            id3FrameConfiguration: configuration
        )
        
        let newTagBytes = id3UserTextFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
