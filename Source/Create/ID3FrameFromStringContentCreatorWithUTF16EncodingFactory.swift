//
//  ID3FrameFromStringContentCreatorWithUTF16EncodingFactory.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 27.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

class ID3FrameFromStringContentCreatorWithUTF16EncodingFactory {
    static func make() -> ID3FrameFromStringContentCreator {
        let paddingAdder = PaddingAdderToEndOfContentUsingNullChar()
        let frameConfiguration = ID3FrameConfiguration()
        let frameHeaderCreator = ID3FrameHeaderCreatorFactory.make()
        return ID3FrameFromStringContentCreator(
            frameHeaderCreator: frameHeaderCreator,
            stringToBytesAdapter: ID3UTF16StringToByteAdapter(paddingAdder: paddingAdder,
                                                              frameConfiguration: frameConfiguration)
        )
    }
}
