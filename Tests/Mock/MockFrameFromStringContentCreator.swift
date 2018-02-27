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
    private let frameName: String

    init(fakeNewFrameAsByte: [UInt8], frameIdentifierToBeChecked: String) {
        self.fakeNewFrameAsByte = fakeNewFrameAsByte
        self.frameName = frameIdentifierToBeChecked
    }

    func createFrame(frameIdentifier: [UInt8], version: ID3Version, content: String) -> [UInt8] {
        if (frameIdentifier == ID3FrameConfiguration().identifierFor(name: frameName, version: version)) {
            return fakeNewFrameAsByte
        } else {
            return []
        }
    }
}
