//
//  ID3SeriesIndexCreatorTest.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3SeriesIndexCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoSeriesIndex() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3SeriesIndexFrameCreator = ID3SeriesIndexFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .SeriesIndex
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3SeriesIndexFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsASeriesIndex() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.SeriesIndex : ID3FrameSeriesIndex(index: 11, totalBooks: 19)]
        )
        let id3GenreFrameCreator = ID3SeriesIndexFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .SeriesIndex
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3GenreFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
