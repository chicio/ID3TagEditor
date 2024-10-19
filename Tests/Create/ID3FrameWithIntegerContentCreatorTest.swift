//
//  ID3RecordingYearFrameCreatorTest.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 10.11.20.
//  Copyright © 2020 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct ID3FrameWithIntegerContentCreatorTest {
    @Test func testNoFrameCreationWhenThereIsNoContent() {
        let id3YearFrameCreator = ID3FrameContentCreator(
                frameCreator: FrameFromIntegerContentAdapter(frameCreator: MockFrameFromStringContentCreator(
                    fakeNewFrameAsByte: [],
                    frameTypeToBeChecked: .recordingYear
                )),
                frameName: .recordingYear,
                frameType: .recordingYear
        )

        let newTagBytes = id3YearFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        #expect(newTagBytes == [])
    }

    @Test func testFrameCreationWhenThereIsContent() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID32v3TagBuilder()
            .recordingYear(frame: ID3FrameWithIntegerContent(value: 2018))
            .build()
        let id3TitleFrameCreator = ID3FrameContentCreator(
                frameCreator: FrameFromIntegerContentAdapter(frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .recordingYear
                )),
                frameName: .recordingYear,
                frameType: .recordingYear
        )

        let newTagBytes = id3TitleFrameCreator.createFrames(id3Tag: id3Tag)

        #expect(newTagBytes == newFrameBytes)
    }
}
