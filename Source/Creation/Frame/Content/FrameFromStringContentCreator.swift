//
//  FrameFromStringContentCreator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol FrameFromStringContentCreator {
    func createFrame(frameIdentifier: [UInt8], version: UInt8, content: String) -> [UInt8]
}