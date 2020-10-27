//
//  MockFrameFromStringContentCreator.swift
//
//  Created by Fabrizio Duroni on 27/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockFrameFromStringContentCreator: FrameFromStringContentCreator {
    private let fakeNewFrameAsByte: [UInt8]
    private let frameType: FrameType

    init(fakeNewFrameAsByte: [UInt8], frameTypeToBeChecked: FrameType) {
        self.fakeNewFrameAsByte = fakeNewFrameAsByte
        self.frameType = frameTypeToBeChecked
    }

    func createFrame(frameType: FrameType, version: ID3Version, content: String) -> [UInt8] {
        if ID3FrameConfiguration().identifierFor(frameType: frameType, version: version) != nil {
            return fakeNewFrameAsByte
        } else {
            return []
        }
    }
}
