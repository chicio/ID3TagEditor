//
//  ID3GenreFrameCreatorTest.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct ID3GenreFrameCreatorTest {
    @Test func testNoFrameCreationWhenThereIsNoGenre() {
        let id3GenreFrameCreator = ID3GenreFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .genre
                )
        )

        let newTagBytes = id3GenreFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        #expect(newTagBytes == [])
    }

    @Test func testFrameCreationWhenThereIsAGenre() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID32v3TagBuilder()
            .genre(frame: ID3FrameGenre(genre: .metal, description: "Metalcore"))
            .build()

        let id3GenreFrameCreator = ID3GenreFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .genre
                )
        )

        let newTagBytes = id3GenreFrameCreator.createFrames(id3Tag: id3Tag)

        #expect(newTagBytes == newFrameBytes)
    }
}
