//
//  ID3UnsyncronizedLyricsFrameCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 14/10/20.
//  2020 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct ID3FramesWithLocalizedContentCreatorTest {
    @Test func testNothingIsCreatedWheLyricsDataIsNotSet() {
        let creator = ID3FramesWithLocalizedContentCreator(
            localizedFrameNames: FrameNamesWithLocalizedContent().get(),
            localizedFrameCreator: MockLocalizedFrameCreator()
        )

        let frame = creator.createFrames(id3Tag: ID32v3TagBuilder().build())

        #expect(frame == [])
    }

    @Test func testCreateFrameForValidData() {
        let creator = ID3FramesWithLocalizedContentCreator(
            localizedFrameNames: FrameNamesWithLocalizedContent().get(),
            localizedFrameCreator: MockLocalizedFrameCreator()
        )

        let frame = creator.createFrames(id3Tag: aTagWithUnsynchronisedLyrics())

        #expect(frame == [0x01])
    }

    private func aTagWithUnsynchronisedLyrics() -> ID3Tag {
        return ID32v3TagBuilder()
            .unsynchronisedLyrics(language: .ita, frame: ID3FrameWithLocalizedContent(
                language: .ita,
                contentDescription: "decription",
                content: "content"
            ))
            .build()
    }
}
