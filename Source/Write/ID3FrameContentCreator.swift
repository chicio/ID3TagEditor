//
//  ID3FrameContentCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 12.11.20.
//  2020 Fabrizio Duroni.
//

import Foundation

class ID3FrameContentCreator: ID3FrameCreator {
    private let frameContentAdapter: FrameContentAdapter
    private let frameName: FrameName
    private let frameType: FrameType

    init(frameCreator: FrameContentAdapter, frameName: FrameName, frameType: FrameType) {
        self.frameContentAdapter = frameCreator
        self.frameName = frameName
        self.frameType = frameType
    }

    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        return frameContentAdapter.createFrames(id3Tag: id3Tag, frameName: frameName, frameType: frameType)
    }
}
