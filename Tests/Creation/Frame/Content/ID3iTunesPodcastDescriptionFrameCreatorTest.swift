//
//  ID3iTunesPodcastDescriptionFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3iTunesPodcastDescriptionFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoiTunesPodcastDescription() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3iTunesPodcastDescriptionFrameCreator = ID3iTunesPodcastDescriptionFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .iTunesPodcastDescription
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3iTunesPodcastDescriptionFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)
        
        XCTAssertEqual(newTagBytes, tagBytes)
    }
    
    func testFrameCreationWhenThereIsAiTunesPodcastDescription() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.iTunesPodcastDescription : ID3FrameWithStringContent(content: "::an example iTunesPodcast description::")]
        )
        let id3iTunesPodcastDescriptionFrameCreator = ID3iTunesPodcastDescriptionFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .iTunesPodcastDescription
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3iTunesPodcastDescriptionFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
