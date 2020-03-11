//
//  ID3UnsyncedLyricsFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3UnsyncedLyricsCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereAreNoLyrics() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3LyricsFrameCreator = ID3UnsyncedLyricsFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .UnsyncedLyrics
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3LyricsFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereAreLyrics() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.UnsyncedLyrics : ID3FrameCommentTypes(language: "eng", contentDescription: "description", contentText: "some sample lyrics text")]
        )
        let id3UnsyncedLyricsFrameCreator = ID3UnsyncedLyricsFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .UnsyncedLyrics
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3UnsyncedLyricsFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
