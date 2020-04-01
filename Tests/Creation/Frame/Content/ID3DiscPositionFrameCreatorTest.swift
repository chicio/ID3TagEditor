//
//  ID3DiscPositionCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3DiscPositionFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoDiscPosition() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3DiscPositionFrameCreator = ID3DiscPositionFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .DiscPosition
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3DiscPositionFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsADiscPosition() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.DiscPosition : ID3FramePartOfTotal(part: 1, total: 3)]
        )
        let id3GenreFrameCreator = ID3DiscPositionFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .DiscPosition
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3GenreFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
