//
//  MockID3FrameCreatorsChain.swift
//
//  Created by Fabrizio Duroni on 28/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockID3FrameCreatorsChain: ID3FrameCreatorsChain {
    var createFramesHasBeenCalled = false
    var frames: [UInt8]

    init(frames: [UInt8] = []) {
        self.frames = frames
    }

    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        createFramesHasBeenCalled = true
        return frames
    }
}
