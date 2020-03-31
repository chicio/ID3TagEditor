//
//  ID3RadioStationUrlFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 03/30/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3RadioStationUrlFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoRadioStationUrl() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3RadioStationUrlFrameCreator = ID3RadioStationUrlFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .RadioStationUrl
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3RadioStationUrlFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)
        
        XCTAssertEqual(newTagBytes, tagBytes)
    }
    
    func testFrameCreationWhenThereIsARadioStationUrl() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.RadioStationUrl : ID3FrameWithStringContent(content: ":: http://www.exampleurl.com ::")]
        )
        let id3RadioStationUrlFrameCreator = ID3RadioStationUrlFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .RadioStationUrl
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3RadioStationUrlFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
