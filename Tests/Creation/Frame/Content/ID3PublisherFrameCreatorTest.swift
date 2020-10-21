//
//  ID3PublisherFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3PublisherFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoPublisher() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3PublisherFrameCreator = ID3PublisherFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .publisher
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3PublisherFrameCreator.createFrames(
            id3Tag: ID3Tag(version: .version3, frames: [:]),
            tag: tagBytes
        )

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsAPublisher() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.publisher: ID3FrameWithStringContent(content: "::an example publisher::")]
        )
        let id3PublisherFrameCreator = ID3PublisherFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .publisher
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3PublisherFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAPublisher", testFrameCreationWhenThereIsAPublisher),
        ("testNoFrameCreationWhenThereIsNoPublisher", testNoFrameCreationWhenThereIsNoPublisher)
    ]
}
