//
//  ID3CommentFrameCreatorTest.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/13/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import XCTest
@testable import ID3TagEditor

class ID3CommentFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoComment() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3CommentFrameCreator = ID3CommentFrameCreator(
            frameCreator: MockCommentTypesFrameContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .Comment
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3CommentFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)
        
        XCTAssertEqual(newTagBytes, tagBytes)
    }
    
    func testFrameCreationWhenThereIsAComment() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.Comment : ID3FrameCommentTypes(language: .zxx, contentDescription: "test", contentText: "::some sample content text::")]
        )
        let id3UnsyncedLyricsFrameCreator = ID3CommentFrameCreator(
            frameCreator: MockCommentTypesFrameContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .Comment
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3UnsyncedLyricsFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
