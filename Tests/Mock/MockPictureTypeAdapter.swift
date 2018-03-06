//
//  MockPictureTypeAdapter.swift
//
//  Created by Fabrizio Duroni on 06/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockPictureTypeAdapter: PictureTypeAdapter {
    func adapt(frame: Data, format: ID3PictureFormat, version: ID3Version) -> ID3PictureType {
        return .FrontCover
    }
}
