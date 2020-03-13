//
//  ID3LanguageFrameCreatorTest.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/13/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import XCTest
@testable import ID3TagEditor

class ID3LanguageFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoLanguage() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3LanguageFrameCreator = ID3LanguageFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: [],
                        frameTypeToBeChecked: .Language
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3LanguageFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)

        XCTAssertEqual(newTagBytes, tagBytes)
    }

    func testFrameCreationWhenThereIsALanguage() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.Language : ID3FrameLanguage(language: .und)]
        )
        let id3LanguageFrameCreator = ID3LanguageFrameCreator(
                frameCreator: MockFrameFromStringContentCreator(
                        fakeNewFrameAsByte: newFrameBytes,
                        frameTypeToBeChecked: .Language
                ),
                id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3LanguageFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)

        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
