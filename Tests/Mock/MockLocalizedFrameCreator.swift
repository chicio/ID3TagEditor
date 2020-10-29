//
//  MockLocalizedFrameCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 14/10/20.
//  2020 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockLocalizedFrameCreator: LocalizedFrameCreator {
    func createFrame(using frameContent: ID3FrameWithLocalizedContent,
                     version: ID3Version,
                     frameType: FrameType) -> [UInt8] {
        return [0x01]
    }
}
