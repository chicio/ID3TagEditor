//
//  FrameFromBooleanContentCreator.swift
//
//  Created by Nolaine Crusher on 03/31/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol FrameFromBooleanContentCreator {
    func createFrame(
        frameIdentifier: [UInt8],
        version: ID3Version,
        value: Bool) -> [UInt8]
}
