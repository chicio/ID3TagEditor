//
//  ID3ContentGroupFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3ContentGroupFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoContentGroup() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3ContentGroupFrameCreator = ID3ContentGroupFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .ContentGroup
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3ContentGroupFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)
        
        XCTAssertEqual(newTagBytes, tagBytes)
    }
    
    func testFrameCreationWhenThereIsAContentGroup() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.ContentGroup : ID3FrameWithStringContent(content: "::an example content grouping::")]
        )
        let id3ContentGroupFrameCreator = ID3ContentGroupFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .ContentGroup
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3ContentGroupFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
