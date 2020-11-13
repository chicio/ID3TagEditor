//
//  ID3FrameFromStringContentCreator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameFromStringContentCreator: FrameFromStringContentCreator {
    private let frameHeaderCreator: FrameHeaderCreator
    private let stringToBytesAdapter: StringToBytesAdapter

    init(frameHeaderCreator: FrameHeaderCreator,
         stringToBytesAdapter: StringToBytesAdapter) {
        self.frameHeaderCreator = frameHeaderCreator
        self.stringToBytesAdapter = stringToBytesAdapter
    }

    func createFrame(frameType: FrameType, version: ID3Version, content: String) -> [UInt8] {
        let frameBody = stringToBytesAdapter.adapt(string: content, for: version)
        let frameHeader = frameHeaderCreator.createUsing(version: version, frameType: frameType, frameBody: frameBody)
        let frame = frameHeader + frameBody
        return frame
    }
}
