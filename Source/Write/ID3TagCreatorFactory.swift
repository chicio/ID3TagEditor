//
//  ID3TagCreatorFactory.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TagCreatorFactory {
    static func make() -> ID3TagCreator {
        let id3FramesCreator = ID3FramesCreator(id3FrameCreators: ID3FrameCreatorsFactory.make())
        let id3TagHeaderCreator = ID3TagHeaderCreator(
            uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapterUsingUnsafePointer(),
            id3TagConfiguration: ID3TagConfiguration())
        let id3TagCreator = ID3TagCreator(id3FramesCreator: id3FramesCreator, id3TagHeaderCreator: id3TagHeaderCreator)
        return id3TagCreator
    }
}
