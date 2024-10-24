//
//  AttachedPictureFrameContentParsingOperationTest.swift
//
//  Created by Fabrizio Duroni on 02/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
import Testing

@testable import ID3TagEditor

struct ID3AttachedPictureFrameContentParsingOperationTest {
    @Test func testSetTagAttachedPicturePng() async {
        let attachedPictureFrameContentParsingOperation = ID3AttachedPictureFrameContentParsingOperation(
                id3FrameConfiguration: ID3FrameConfiguration(),
                pictureTypeAdapter: MockPictureTypeAdapter()
        )

        await confirmation("attached picture") { parsed in
            attachedPictureFrameContentParsingOperation.parse(
                frame: Data([0x89, 0x50, 0x4E, 0x47, 0x11, 0x11]),
                version: .version3,
                completed: {(frameName, frame) in
                        #expect(frameName == .attachedPicture(.frontCover))
                        #expect((frame as? ID3FrameAttachedPicture)?.format == .png)
                        #expect(
                            (frame as? ID3FrameAttachedPicture)?.picture ==
                            Data([0x89, 0x50, 0x4E, 0x47, 0x11, 0x11])
                        )
                        #expect((frame as? ID3FrameAttachedPicture)?.type == .frontCover)
                        parsed()
            })
        }
    }

    @Test func testSetTagAttachedPictureJpg() async {
        let attachedPictureFrameContentParsingOperation = ID3AttachedPictureFrameContentParsingOperation(
                id3FrameConfiguration: ID3FrameConfiguration(),
                pictureTypeAdapter: MockPictureTypeAdapter()
        )

        await confirmation("attached picture") { parsed in
            attachedPictureFrameContentParsingOperation.parse(
                frame: Data([0xFF, 0xD8, 0xFF, 0xE0, 0x11, 0x11]),
                version: .version3,
                completed: {(frameName, frame) in
                    #expect(frameName == .attachedPicture(.frontCover))
                    #expect((frame as? ID3FrameAttachedPicture)?.format == .jpeg)
                    #expect(
                        (frame as? ID3FrameAttachedPicture)?.picture ==
                        Data([0xFF, 0xD8, 0xFF, 0xE0, 0x11, 0x11])
                    )
                    #expect((frame as? ID3FrameAttachedPicture)?.type == .frontCover)
                    parsed()
                })
        }
    }
}
