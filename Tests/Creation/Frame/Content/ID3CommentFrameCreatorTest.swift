//
//  ID3CommentFrameCreatorTest.swift
//  ID3TagEditor macOS
//
//  Created by Nolaine Crusher on 3/11/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3CommentCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoComment() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3CommentFrameCreator = ID3UnsyncedLyricsFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .Comment
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3CommentFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsATComment() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.Comment : ID3FrameCommentTypes(language: "eng", contentDescription: "description", contentText: "some sample comment text")]
        )
        let id3CommentFrameCreator = ID3CommentFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .Comment
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3CommentFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
