//
//  LocalizedFrameCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 29.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

protocol LocalizedFrameCreator {
    func createFrame(using frameContent: ID3FrameWithLocalizedContent,
                     version: ID3Version,
                     frameType: FrameType) -> [UInt8]
}
