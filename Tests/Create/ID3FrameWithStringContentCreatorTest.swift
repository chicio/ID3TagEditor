//
//  ID3FrameWithStringContentCreatorTest.swift
//
//  Created by Fabrizio Duroni on 09.11.20.
//  2020 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct ID3FrameWithStringContentCreatorTest {
    @Test func testNoFrameCreationWhenThereIsNoFrameData() {
        let id3AlbumFrameCreator = ID3FrameContentCreator(
            frameCreator: FrameFromStringContentAdapter(frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .album
            )),
            frameName: .album,
            frameType: .album
        )

        let newTagBytes = id3AlbumFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        #expect(newTagBytes == [])
    }

    @Test func testFrameCreationWhenThereIsFrameData() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID32v3TagBuilder()
            .album(frame: ID3FrameWithStringContent(content: "::an example album::"))
            .build()
        let id3AlbumFrameCreator = ID3FrameContentCreator(
            frameCreator: FrameFromStringContentAdapter(frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .album
            )),
            frameName: .album,
            frameType: .album
        )

        let newTagBytes = id3AlbumFrameCreator.createFrames(id3Tag: id3Tag)

        #expect(newTagBytes == newFrameBytes)
    }
}
