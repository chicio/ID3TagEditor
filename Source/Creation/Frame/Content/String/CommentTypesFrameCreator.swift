//
//  CommentTypesFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/11/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

protocol CommentTypesFrameCreator {
    func createFrame(
        frameIdentifier: [UInt8],
        version: ID3Version,
        language: ISO_639_2_Codes?,
        description: String?,
        content: String) -> [UInt8]
}
