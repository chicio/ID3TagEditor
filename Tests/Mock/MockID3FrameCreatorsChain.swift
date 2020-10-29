//
//  MockID3FrameCreatorsChain.swift
//
//  Created by Fabrizio Duroni on 28/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockID3FrameCreatorsChain: ID3FrameCreator {
    var createFramesHasBeenCalled = false
    var frames: [UInt8]

    init(frames: [UInt8] = []) {
        self.frames = frames
    }

    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        createFramesHasBeenCalled = true
        return frames
    }
}
