//
//  ID3EncodedByFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3EncodedByFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoEncodedBy() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3EncodedByFrameCreator = ID3EncodedByFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .EncodedBy
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3EncodedByFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)
        
        XCTAssertEqual(newTagBytes, tagBytes)
    }
    
    func testFrameCreationWhenThereIsAnEncodedBy() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.EncodedBy : ID3FrameWithStringContent(content: "::an example encodedBy::")]
        )
        let id3EncodedByFrameCreator = ID3EncodedByFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .EncodedBy
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3EncodedByFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
