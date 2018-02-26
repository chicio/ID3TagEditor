//
//  ID3FrameCreatorsChain.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameCreatorsChain {
    var nextCreator: ID3FrameCreatorsChain?

    func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let validNextCreator = nextCreator {
            return validNextCreator.createFrames(id3Tag: id3Tag, tag: tag)
        }
        return tag
    }
}
