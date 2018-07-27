//
//  ID3YearFrameCreatorTest.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3YearFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoYear() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3YearFrameCreator = ID3YearFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .RecordingYear
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3YearFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, size: 0), tag: tagBytes)

        XCTAssertEqual(newTagBytes, tagBytes)
    }
    
    func testNoFrameCreationWhenIsVersion4() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3YearFrameCreator = ID3YearFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [2, 2],
                frameTypeToBeChecked: .RecordingYear
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        let id3tag = ID3Tag(version: .version4, size: 0)
        id3tag.recordingDateTime?.date?.year = "2018"
        
        let newTagBytes = id3YearFrameCreator.createFrames(id3Tag: id3tag, tag: tagBytes)
        
        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsAnYear() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(version: .version3, size: 0)
        id3Tag.recordingDateTime?.date?.year = "2018"
        let id3TitleFrameCreator = ID3YearFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .RecordingYear
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3TitleFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
