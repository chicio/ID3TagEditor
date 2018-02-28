//
//  MockPaddingAdder.swift
//
//  Created by Fabrizio Duroni on 28/02/2018.
//  2018 Fabrizio Duroni.
//


import Foundation
@testable import ID3TagEditor

class MockPaddingAdder: PaddingAdder {
    func addTo(content: [UInt8]) -> [UInt8] {
        return [0x0] + content + [0x0]
    }
}
