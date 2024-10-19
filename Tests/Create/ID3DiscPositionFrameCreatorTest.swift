//
//  ID3DiscPositionFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct ID3DiscPositionFrameCreatorTest {
    @Test func testNoFrameCreationWhenThereIsNoDiscPosition() {
        let id3DiscPositionFrameCreator = ID3DiscPositionFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .discPosition
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3DiscPositionFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        #expect(newTagBytes == [])
    }

    @Test func testFrameCreationWhenThereIsADiscPosition() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID32v3TagBuilder()
            .discPosition(frame: ID3FramePartOfTotal(part: 1, total: 3))
            .build()

        let id3GenreFrameCreator = ID3DiscPositionFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .discPosition
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3GenreFrameCreator.createFrames(id3Tag: id3Tag)

        #expect(newTagBytes == newFrameBytes)
    }
}
