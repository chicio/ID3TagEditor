//
//  MockTimestampCreator.swift
//
//  Created by Fabrizio Duroni on 28/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockSynchsafeEncoder: SynchsafeEncoder {
    private let encodedValue: UInt32

    init(encodedValue: UInt32) {
        self.encodedValue = encodedValue
    }
    func encode(integer: UInt32) -> UInt32 {
        return self.encodedValue
    }
}
