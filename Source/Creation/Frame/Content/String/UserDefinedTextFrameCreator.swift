//
//  UserDefinedTextFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/13/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

protocol UserDefinedTextFrameCreator {
    func createFrame(frameIdentifier: [UInt8], version: ID3Version, description: String?, content: String) -> [UInt8]
}
