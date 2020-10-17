//
//  ID3GenreFrameCreatorTest.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3GenreFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoGenre() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3GenreFrameCreator = ID3GenreFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .genre
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3GenreFrameCreator.createFrames(
            id3Tag: ID3Tag(version: .version3, frames: [:]),
            tag: tagBytes
        )

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsAGenre() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.genre: ID3FrameGenre(genre: .metal, description: "Metalcore")]
        )
        let id3GenreFrameCreator = ID3GenreFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .genre
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3GenreFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
