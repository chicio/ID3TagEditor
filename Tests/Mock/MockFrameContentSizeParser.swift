//
//  MockFrameContentSizeParser.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockFrameContentSizeParser: FrameContentSizeParser {
    func parse(mp3: NSData, framePosition: Int, version: ID3Version) -> Int {
        return mp3.length
    }
}
