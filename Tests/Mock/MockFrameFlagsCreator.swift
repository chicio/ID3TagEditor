//
//  MockFrameFlagsCreator.swift
//
//  Created by Fabrizio Duroni on 27/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockFrameFlagsCreator: FrameFlagsCreator {
    func createFor(version: ID3Version) -> [UInt8] {
        return [0x00]
    }
}
