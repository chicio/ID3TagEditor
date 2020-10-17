//
//  MockFrameContentSizeCalculatorForHeader.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 14/10/20.
//  2020 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockFrameContentSizeCalculatorForHeader: FrameContentSizeCalculator {
    func calculateSizeOf(content: [UInt8], version: ID3Version) -> [UInt8] {
        if content == [0x11] {
            return [0x11]
        }
        return [0x00]
    }
}
