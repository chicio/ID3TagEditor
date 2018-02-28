//
//  MockUInt32ToByteArrayAdapter.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//
import Foundation
@testable import ID3TagEditor

class MockUInt32ToByteArrayAdapter: UInt32ToByteArrayAdapter {
    func adapt(uInt32: UInt32) -> [UInt8] {
        return [0x3, 0x2]
    }
}
