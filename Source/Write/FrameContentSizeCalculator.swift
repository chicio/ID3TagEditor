//
//  FrameContentSizeCalculator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol FrameContentSizeCalculator {
    func calculateSizeOf(content: [UInt8], version: ID3Version) -> [UInt8]
}
