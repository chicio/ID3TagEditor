//
//  ID3CopyrightUrlFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 03/30/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3CopyrightUrlFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoCopyrightUrl() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3CopyrightUrlFrameCreator = ID3CopyrightUrlFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .CopyrightUrl
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3CopyrightUrlFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)
        
        XCTAssertEqual(newTagBytes, tagBytes)
    }
    
    func testFrameCreationWhenThereIsACopyrightUrl() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.CopyrightUrl : ID3FrameWithStringContent(content: ":: http://www.exampleurl.com ::")]
        )
        let id3CopyrightUrlFrameCreator = ID3CopyrightUrlFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .CopyrightUrl
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3CopyrightUrlFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
