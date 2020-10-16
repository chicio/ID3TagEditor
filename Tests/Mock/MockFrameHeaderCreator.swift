//
//  MockFrameHeaderCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 16.10.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation
@testable import ID3TagEditor

class MockFrameHeaderCreator: FrameHeaderCreator {
    func createUsing(version: ID3Version, frameType: FrameType, frameBody: [UInt8]) -> [UInt8] {
        return [0x01, 0x02]
    }
}
