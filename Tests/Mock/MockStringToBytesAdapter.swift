//
//  MockStringToBytesAdapter.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 27.10.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation
@testable import ID3TagEditor

final class MockStringToBytesAdapter: StringToBytesAdapter {
    func adapt(string: String, for version: ID3Version) -> [UInt8] {
        return string.utf16ToBytes
    }
}
