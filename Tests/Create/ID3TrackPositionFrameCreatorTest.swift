//
//  ID3TrackPositionCreatorTest.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct ID3TrackPositionCreatorTest {
    @Test func testNoFrameCreationWhenThereIsNoTrackPosition() {
        let id3TrackPositionFrameCreator = ID3TrackPositionFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .trackPosition
                )
        )

        let newTagBytes = id3TrackPositionFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        #expect(newTagBytes == [])
    }

    @Test func testFrameCreationWhenThereIsATrackPosition() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID32v3TagBuilder()
            .trackPosition(frame: ID3FramePartOfTotal(part: 1, total: 10))
            .build()

        let id3GenreFrameCreator = ID3TrackPositionFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .trackPosition
                )
        )

        let newTagBytes = id3GenreFrameCreator.createFrames(id3Tag: id3Tag)

        #expect(newTagBytes == newFrameBytes)
    }
}
