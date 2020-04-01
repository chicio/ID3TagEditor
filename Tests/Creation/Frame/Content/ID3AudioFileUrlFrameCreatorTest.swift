//
//  ID3AudioFileUrlFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 03/30/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3AudioFileUrlFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoAudioFileUrl() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3AudioFileUrlFrameCreator = ID3AudioFileUrlFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .AudioFileUrl
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3AudioFileUrlFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)
        
        XCTAssertEqual(newTagBytes, tagBytes)
    }
    
    func testFrameCreationWhenThereIsAnAudioFileUrl() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.AudioFileUrl : ID3FrameWithStringContent(content: ":: http://www.exampleurl.com ::")]
        )
        let id3AudioFileUrlFrameCreator = ID3AudioFileUrlFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .AudioFileUrl
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3AudioFileUrlFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
