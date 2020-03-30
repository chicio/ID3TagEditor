//
//  ID3RadioStationOwnerFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 03/30/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3RadioStationOwnerFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoRadioStationOwner() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3RadioStationOwnerFrameCreator = ID3RadioStationOwnerFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .RadioStationOwner
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3RadioStationOwnerFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)
        
        XCTAssertEqual(newTagBytes, tagBytes)
    }
    
    func testFrameCreationWhenThereIsARadioStationOwner() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.RadioStationOwner : ID3FrameWithStringContent(content: ":: example radio station owner::")]
        )
        let id3RadioStationOwnerFrameCreator = ID3RadioStationOwnerFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .RadioStationOwner
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3RadioStationOwnerFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
