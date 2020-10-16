//
//  ID3iTunesGroupingFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3iTunesGroupingFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoGrouping() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3iTunesGroupingFrameCreator = ID3iTunesGroupingFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .iTunesGrouping
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3iTunesGroupingFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsAGrouping() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.iTunesGrouping: ID3FrameWithStringContent(content: "::an example grouping::")]
        )
        let id3iTunesGroupingFrameCreator = ID3iTunesGroupingFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .iTunesGrouping
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3iTunesGroupingFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
