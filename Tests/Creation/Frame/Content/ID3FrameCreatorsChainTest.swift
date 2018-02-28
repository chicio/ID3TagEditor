//
//  ID3FrameCreatorsChain.swift
//
//  Created by Fabrizio Duroni on 28/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3FrameCreatorsChainTest: XCTestCase {

    func testNextCreatorCalled() {
        let id3FrameCreatorsChain = ID3FrameCreatorsChain()
        let anotherFrameCreatorChain = MockID3FrameCreatorsChain()
        id3FrameCreatorsChain.nextCreator = anotherFrameCreatorChain

        _ = id3FrameCreatorsChain.createFrames(id3Tag: ID3Tag(version: .version2, size: 0), tag: [])

        XCTAssertTrue(anotherFrameCreatorChain.createFramesHasBeenCalled)
    }

    func testCurrentTagBytesAreReturnedWhenThereIsNotANextCreator() {
        let id3FrameCreatorsChain = ID3FrameCreatorsChain()
        let currentTagBytes: [UInt8] = [0x1, 0x1]

        let newTagBytes = id3FrameCreatorsChain.createFrames(id3Tag: ID3Tag(version: .version2, size: 0), tag: currentTagBytes)

        XCTAssertEqual(currentTagBytes, newTagBytes)
    }
}
