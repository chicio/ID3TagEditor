//
//  ID3iTunesMovementIndexCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3iTunesMovementIndexFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoMovementIndex() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3MovementIndexFrameCreator = ID3iTunesMovementIndexFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .iTunesMovementIndex
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
            frames: [.iTunesMovementIndex : ID3FrameWithIntegerContent(value: 6)]
        )
        let id3MovementIndexFrameCreator = ID3iTunesMovementIndexFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .iTunesMovementIndex
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3MovementIndexFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
