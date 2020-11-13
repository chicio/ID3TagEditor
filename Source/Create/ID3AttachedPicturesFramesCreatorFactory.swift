//
//  ID3AttachedPicturesFramesCreatorFactory.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 29.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

class ID3AttachedPicturesFramesCreatorFactory {
    static func make() -> ID3AttachedPicturesFramesCreator {
        let frameConfiguration = ID3FrameConfiguration()
        return ID3AttachedPicturesFramesCreator(
            attachedPictureFrameCreator: ID3AttachedPictureFrameCreator(
                id3FrameConfiguration: frameConfiguration,
                id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration(),
                frameHeaderCreator: ID3FrameHeaderCreatorFactory.make()
            )
        )
    }
}
