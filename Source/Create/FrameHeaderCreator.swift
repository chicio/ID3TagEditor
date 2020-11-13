//
//  FrameHeaderCreator.swift
//
//  Created by Fabrizio Duroni on 14/10/20.
//  2020 Fabrizio Duroni.
//

import Foundation

protocol FrameHeaderCreator {
    func createUsing(version: ID3Version, frameType: FrameType, frameBody: [UInt8]) -> [UInt8]
}
