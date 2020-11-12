//
//  ID3FrameHeaderCreatorChain.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 27.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

class ID3FrameHeaderCreatorFactory {
    static func make() -> ID3FrameHeaderCreator {
        let frameConfiguration = ID3FrameConfiguration()
        let frameContentSizeCalculator = ID3FrameContentSizeCalculator(
            uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapterUsingUnsafePointer(),
            synchsafeEncoder: SynchsafeIntegerEncoder()
        )
        let frameFlagsCreator = ID3FrameFlagsCreator()
        return ID3FrameHeaderCreator(
            id3FrameConfiguration: frameConfiguration,
            frameContentSizeCalculator: frameContentSizeCalculator,
            frameFlagsCreator: frameFlagsCreator
        )
    }
}
