//
//  ID3FramesWithUserDefinedTextInformationCreatorFactory.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 26/07/2025.
//  2025 Fabrizio Duroni.
//

import Foundation

class ID3FramesWithUserDefinedTextInformationCreatorFactory {
    static func make() -> ID3FramesWithUserDefinedTextInformationCreator {
        let frameConfiguration = ID3FrameConfiguration()
        let paddingAdder = PaddingAdderToEndOfContentUsingNullChar()

        return ID3FramesWithUserDefinedTextInformationCreator(
            userDefinedTextInformationFrameCreator: ID3UserDefinedTextInformationFrameCreator(
                id3FrameConfiguration: frameConfiguration,
                frameHeaderCreator: ID3FrameHeaderCreatorFactory.make(),
                paddingAdder: paddingAdder
            )
        )
    }
}