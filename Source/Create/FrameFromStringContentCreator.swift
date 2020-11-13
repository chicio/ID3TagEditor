//
//  FrameFromStringContentCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 27.10.20.
//  2020 Fabrizio Duroni
//

import Foundation

protocol FrameFromStringContentCreator {
    func createFrame(frameType: FrameType, version: ID3Version, content: String) -> [UInt8]
}
