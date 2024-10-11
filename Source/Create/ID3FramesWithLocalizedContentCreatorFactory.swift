//
//  ID3FramesWithLocalizedContentCreatorFactory.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 29.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

class ID3FramesWithLocalizedContentCreatorFactory {
    static func make() -> ID3FramesWithLocalizedContentCreator {
        let frameConfiguration = ID3FrameConfiguration()
        let paddingAdder = PaddingAdderToEndOfContentUsingNullChar()

        return ID3FramesWithLocalizedContentCreator(
            localizedFrameNames: FrameNamesWithLocalizedContent().get(),
            localizedFrameCreator: ID3LocalizedFrameCreator(
                id3FrameConfiguration: frameConfiguration,
                frameHeaderCreator: ID3FrameHeaderCreatorFactory.make(),
                paddingAdder: paddingAdder
            )
        )
    }
}
