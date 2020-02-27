//
//  ID3PodcastKeywordsFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3PodcastKeywordsFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereAreNoPodcastKeywords() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3PodcastKeywordsFrameCreator = ID3PodcastKeywordsFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .PodcastKeywords
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3PodcastKeywordsFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)
        
        XCTAssertEqual(newTagBytes, tagBytes)
    }
    
    func testFrameCreationWhenThereArePodcastKeywords() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.PodcastKeywords : ID3FrameWithStringContent(content: "::an example podcast keyword::")]
        )
        let id3PodcastKeywordsFrameCreator = ID3PodcastKeywordsFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .PodcastKeywords
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3PodcastKeywordsFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
