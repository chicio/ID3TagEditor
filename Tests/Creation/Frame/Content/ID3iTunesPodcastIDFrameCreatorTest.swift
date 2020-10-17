//
//  ID3iTunesPodcastIDFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3iTunesPodcastIDFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoPodcastID() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3PodcastIDFrameCreator = ID3iTunesPodcastIDFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .iTunesPodcastID
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3PodcastIDFrameCreator.createFrames(
            id3Tag: ID3Tag(version: .version3, frames: [:]),
            tag: tagBytes
        )

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsAPodcastID() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.iTunesPodcastID: ID3FrameWithStringContent(content: "::an example podcast ID::")]
        )
        let id3PodcastIDFrameCreator = ID3iTunesPodcastIDFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .iTunesPodcastID
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3PodcastIDFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
