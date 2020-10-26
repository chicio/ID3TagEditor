//
//  ID3iTunesPodcastDescriptionFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3iTunesPodcastDescriptionFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoPodcastDescription() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3PodcastDescriptionFrameCreator = ID3iTunesPodcastDescriptionFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .iTunesPodcastDescription
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3PodcastDescriptionFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build(),
            tag: tagBytes
        )

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsAPodcastDescription() {
        let frameContent = ID3FrameWithStringContent(content: "::an example podcast description::")
        let frames = [FrameName.iTunesPodcastDescription: frameContent]
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: frames
        )
        let id3PodcastDescriptionFrameCreator = ID3iTunesPodcastDescriptionFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .iTunesPodcastDescription
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3PodcastDescriptionFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAPodcastDescription", testFrameCreationWhenThereIsAPodcastDescription),
        ("testNoFrameCreationWhenThereIsNoPodcastDescription", testNoFrameCreationWhenThereIsNoPodcastDescription)
    ]
}
