//
//  ID3SortAlbumArtistFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 03/30/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3SortAlbumArtistFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoSortAlbumArtist() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3SortAlbumArtistFrameCreator = ID3SortAlbumArtistFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .SortAlbumArtist
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3SortAlbumArtistFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)
        
        XCTAssertEqual(newTagBytes, tagBytes)
    }
    
    func testFrameCreationWhenThereIsASortAlbumArtist() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.SortAlbumArtist : ID3FrameWithStringContent(content: ":: example album artist sort::")]
        )
        let id3SortAlbumArtistFrameCreator = ID3SortAlbumArtistFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .SortAlbumArtist
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3SortAlbumArtistFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
