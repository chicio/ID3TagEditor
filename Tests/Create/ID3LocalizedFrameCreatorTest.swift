//
//  ID3UnsynchronisedLyricForLanguageFrameCreatorTest.swift
//  ID3TagEditor macOS Tests
//
//  Created by Fabrizio Duroni on 14.10.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Testing
@testable import ID3TagEditor

struct ID3LocalizedFrameCreatorTest {
    @Test func testCreatev2() {
        let creator = ID3LocalizedFrameCreator(
            id3FrameConfiguration: ID3FrameConfiguration(),
            frameHeaderCreator: MockFrameHeaderCreator(),
            paddingAdder: MockPaddingAdder()
        )

        let frame = creator.createFrame(using: ID3FrameWithLocalizedContent(language: .ita,
                                                                            contentDescription: "content description",
                                                                            content: "lyrics"),
                                        version: .version2,
                                        frameType: .unsyncronisedLyrics)

        #expect(frame ==
                       [0x01, 0x02, 0x01, 0x69, 0x74, 0x61, 0xFF, 0xFE, 0x63, 0x00, 0x6F, 0x00,
                        0x6E, 0x00, 0x74, 0x00, 0x65, 0x00, 0x6E, 0x00, 0x74, 0x00, 0x20, 0x00,
                        0x64, 0x00, 0x65, 0x00, 0x73, 0x00, 0x63, 0x00, 0x72, 0x00, 0x69, 0x00,
                        0x70, 0x00, 0x74, 0x00, 0x69, 0x00, 0x6F, 0x00, 0x6E, 0x00, 0x00, 0xFF,
                        0xFE, 0x6C, 0x00, 0x79, 0x00, 0x72, 0x00, 0x69, 0x00, 0x63, 0x00, 0x73,
                        0x00])
    }

    @Test func testCreatev3() {
        let creator = ID3LocalizedFrameCreator(
            id3FrameConfiguration: ID3FrameConfiguration(),
            frameHeaderCreator: MockFrameHeaderCreator(),
            paddingAdder: MockPaddingAdder()
        )

        let frame = creator.createFrame(using: ID3FrameWithLocalizedContent(language: .ita,
                                                                            contentDescription: "content description",
                                                                            content: "lyrics"),
                                        version: .version3,
                                        frameType: .unsyncronisedLyrics)

        #expect(frame ==
                       [0x01, 0x02, 0x01, 0x69, 0x74, 0x61, 0xFF, 0xFE, 0x63, 0x00, 0x6F, 0x00,
                        0x6E, 0x00, 0x74, 0x00, 0x65, 0x00, 0x6E, 0x00, 0x74, 0x00, 0x20, 0x00,
                        0x64, 0x00, 0x65, 0x00, 0x73, 0x00, 0x63, 0x00, 0x72, 0x00, 0x69, 0x00,
                        0x70, 0x00, 0x74, 0x00, 0x69, 0x00, 0x6F, 0x00, 0x6E, 0x00, 0x00, 0xFF,
                        0xFE, 0x6C, 0x00, 0x79, 0x00, 0x72, 0x00, 0x69, 0x00, 0x63, 0x00, 0x73,
                        0x00])
    }

    @Test func testCreatev4() {
        let creator = ID3LocalizedFrameCreator(
            id3FrameConfiguration: ID3FrameConfiguration(),
            frameHeaderCreator: MockFrameHeaderCreator(),
            paddingAdder: MockPaddingAdder()
        )

        let frame = creator.createFrame(using: ID3FrameWithLocalizedContent(language: .ita,
                                                                            contentDescription: "content description",
                                                                            content: "lyrics"),
                                        version: .version4,
                                        frameType: .unsyncronisedLyrics)

        #expect(frame ==
                       [0x01, 0x02, 0x01, 0x69, 0x74, 0x61, 0xFF, 0xFE, 0x63, 0x00, 0x6F, 0x00,
                        0x6E, 0x00, 0x74, 0x00, 0x65, 0x00, 0x6E, 0x00, 0x74, 0x00, 0x20, 0x00,
                        0x64, 0x00, 0x65, 0x00, 0x73, 0x00, 0x63, 0x00, 0x72, 0x00, 0x69, 0x00,
                        0x70, 0x00, 0x74, 0x00, 0x69, 0x00, 0x6F, 0x00, 0x6E, 0x00, 0x00, 0xFF,
                        0xFE, 0x6C, 0x00, 0x79, 0x00, 0x72, 0x00, 0x69, 0x00, 0x63, 0x00, 0x73,
                        0x00])
    }
}
