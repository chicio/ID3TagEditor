//
//  CreditsListFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 4/2/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

protocol CreditsListFrameCreator {
    func createFrame(
        frameIdentifier: [UInt8],
        version: ID3Version,
        entries: [(role: String, person: String)]) -> [UInt8]
}
