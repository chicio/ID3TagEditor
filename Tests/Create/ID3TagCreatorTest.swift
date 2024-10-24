//
//  ID3TagCreatorTest.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
import Testing

@testable import ID3TagEditor

struct ID3TagCreatorTest {
    @Test func testNoValidFrameData() {
        let id3FramesCreator = ID3FramesCreator(id3FrameCreators: [MockID3FrameCreatorsChain()])
        let id3TagHeaderCreator = ID3TagHeaderCreator(uInt32ToByteArrayAdapter: MockUInt32ToByteArrayAdapter(),
                                                      id3TagConfiguration: ID3TagConfiguration())
        let id3TagCreator = ID3TagCreator(id3FramesCreator: id3FramesCreator, id3TagHeaderCreator: id3TagHeaderCreator)

        #expect(throws: ID3TagEditorError.invalidTagData.self) {
            try id3TagCreator.create(id3Tag: ID32v3TagBuilder().build())
        }
    }

    @Test func testTagTooBig() {
        let id3FrameCreators = [MockID3FrameCreatorsChain(frames: [UInt8](repeating: 0x0, count: 0xFFFFFFF))]
        let id3FramesCreator = ID3FramesCreator(id3FrameCreators: id3FrameCreators)
        let id3TagHeaderCreator = ID3TagHeaderCreator(uInt32ToByteArrayAdapter: MockUInt32ToByteArrayAdapter(),
                                                      id3TagConfiguration: ID3TagConfiguration())
        let id3TagCreator = ID3TagCreator(id3FramesCreator: id3FramesCreator, id3TagHeaderCreator: id3TagHeaderCreator)

        #expect(throws: ID3TagEditorError.tagTooBig.self) {
            try id3TagCreator.create(id3Tag: ID32v3TagBuilder().build())
        }
    }

    @Test func testGenerateValidData() throws {
        let id3FrameCreators = [MockID3FrameCreatorsChain(frames: [0x22, 0x33])]
        let id3FramesCreator = ID3FramesCreator(id3FrameCreators: id3FrameCreators)
        let id3TagHeaderCreator = ID3TagHeaderCreator(uInt32ToByteArrayAdapter: MockUInt32ToByteArrayAdapter(),
                                                      id3TagConfiguration: ID3TagConfiguration())
        let id3TagCreator = ID3TagCreator(id3FramesCreator: id3FramesCreator, id3TagHeaderCreator: id3TagHeaderCreator)

        #expect(
                try id3TagCreator.create(id3Tag: ID32v3TagBuilder().build()) ==
                Data(ID3TagConfiguration().headerFor(version: .version3)
                        + [0x0, 0x3, 0x2, 0x22, 0x33] + [UInt8](repeating: 0x0, count: 2048)
                )
        )
    }
}
