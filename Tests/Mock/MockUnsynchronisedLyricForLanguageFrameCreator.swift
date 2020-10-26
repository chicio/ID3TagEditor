//
//  MockUnsynchronisedLyricForLanguageFrameCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 14/10/20.
//  2020 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockUnsynchronisedLyricForLanguageFrameCreator: UnsynchronisedLyricForLanguageFrameCreator {
    func createFrame(using unsynchronisedLyric: ID3FrameWithLocalizedContent, version: ID3Version) -> [UInt8] {
        return [0x01]
    }
}
