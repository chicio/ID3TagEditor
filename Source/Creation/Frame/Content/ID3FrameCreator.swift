//
//  ID3FrameCreator.swift
//
//  Created by Fabrizio Duroni on 26.02.18.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol ID3FrameCreator {
    func createFrames(id3Tag: ID3Tag) -> [UInt8]
}
