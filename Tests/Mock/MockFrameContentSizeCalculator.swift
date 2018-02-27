//
//  MockFrameContentSizeCalculator.swift
//
//  Created by Fabrizio Duroni on 27/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockFrameContentSizeCalculator: FrameContentSizeCalculator {
    func calculateSizeOf(content: [UInt8], version: ID3Version) -> [UInt8] {
        return [0x11]
    }
}
