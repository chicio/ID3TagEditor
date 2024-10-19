//
//  ID3FrameHeaderCreatorTest.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 14/10/20.
//  2020 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct ID3FrameHeaderCreatorTest {
    @Test func create() {
        let headerCreator = ID3FrameHeaderCreator(id3FrameConfiguration: ID3FrameConfiguration(),
                                                  frameContentSizeCalculator: MockFrameContentSizeCalculatorForHeader(),
                                                  frameFlagsCreator: MockFrameFlagsCreator())

        let header = headerCreator.createUsing(version: .version3, frameType: .unsyncronisedLyrics, frameBody: [0x11])

        #expect(header == [UInt8]("USLT".utf8) + [0x11, 0x00])
    }
}
