//
//  ID3TagCreatorFactory.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TagCreatorFactory {
    static func make() -> ID3TagCreator {
        let id3TagCreator = ID3TagCreator(
                id3FrameCreatorsChain: ID3FrameCreatorsChainFactory.make(),
                uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapterUsingUnsafePointer(),
                id3TagConfiguration: ID3TagConfiguration())
        return id3TagCreator
    }
}