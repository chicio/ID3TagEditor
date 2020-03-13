//
//  MockCommentTypesFrameContentCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/13/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation
@testable import ID3TagEditor

class MockCommentTypesFrameContentCreator: CommentTypesFrameCreator {
    
    private let fakeNewFrameAsByte: [UInt8]
    private let frameType: FrameType

    init(fakeNewFrameAsByte: [UInt8], frameTypeToBeChecked: FrameType) {
        self.fakeNewFrameAsByte = fakeNewFrameAsByte
        self.frameType = frameTypeToBeChecked
    }

    func createFrame(frameIdentifier: [UInt8], version: ID3Version, language: ISO_639_2_Codes, description: String?, content: String) -> [UInt8] {
        if (frameIdentifier == ID3FrameConfiguration().identifierFor(frameType: frameType, version: version)) {
            return fakeNewFrameAsByte
        } else {
            return []
        }
    }
}
