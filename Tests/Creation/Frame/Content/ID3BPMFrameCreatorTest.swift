//
//  ID3BPMFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 03/30/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3BPMFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoBPM() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3BPMFrameCreator = ID3BPMFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .BPM
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3BPMFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)
        
        XCTAssertEqual(newTagBytes, tagBytes)
    }
    
    func testFrameCreationWhenThereIsABPM() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.BPM : ID3FrameWithIntegerContent(value: 99)]
        )
        let id3BPMFrameCreator = ID3BPMFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .BPM
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3BPMFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
