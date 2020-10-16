//
//  ID3FrameHeaderCreatorTest.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 14/10/20.
//  2020 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3FrameHeaderCreatorTest: XCTestCase {
    func testCreate() {
        let headerCreator = ID3FrameHeaderCreator(id3FrameConfiguration: ID3FrameConfiguration(),
                                                  frameContentSizeCalculator: MockFrameContentSizeCalculatorForHeader(),
                                                  frameFlagsCreator: MockFrameFlagsCreator())
        
        let header = headerCreator.createUsing(version: .version3, frameType: .unsyncronisedLyrics, frameBody: [0x11])
        
        XCTAssertEqual(header, [UInt8]("USLT".utf8) + [0x11, 0x00])
    }
}
