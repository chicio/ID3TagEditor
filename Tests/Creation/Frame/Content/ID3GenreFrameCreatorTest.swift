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
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereIsAGenre() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID32v3TagBuilder()
            .genre(frame: ID3FrameGenre(genre: .metal, description: "Metalcore"))
            .build()

        let id3GenreFrameCreator = ID3GenreFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .genre
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3GenreFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereIsAGenre", testFrameCreationWhenThereIsAGenre),
        ("testNoFrameCreationWhenThereIsNoGenre", testNoFrameCreationWhenThereIsNoGenre)
    ]
}
