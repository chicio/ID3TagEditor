//
//  FrameFromStringContentCreator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol FrameFromStringContentCreator {
    func createFrame(
        frameIdentifier: [UInt8],
        version: ID3Version, content: String) -> [UInt8]
}
