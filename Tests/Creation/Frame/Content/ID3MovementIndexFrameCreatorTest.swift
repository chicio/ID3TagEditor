//
//  ID3MovementIndexCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3MovementIndexCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoMovementIndex() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3MovementIndexFrameCreator = ID3MovementIndexFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .MovementIndex
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3MovementIndexFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsAMovementIndex() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.MovementIndex : ID3FrameMovementIndex(index: 6, totalMovements: 13)]
        )
        let id3GenreFrameCreator = ID3MovementIndexFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .MovementIndex
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3GenreFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
