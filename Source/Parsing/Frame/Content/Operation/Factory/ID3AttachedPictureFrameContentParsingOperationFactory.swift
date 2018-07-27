//
//  ID3AttachedPictureFrameContentParsingOperationFactory.swift
//
//  Created by Fabrizio Duroni on 27/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3AttachedPictureFrameContentParsingOperationFactory {
    static func make() -> ID3AttachedPictureFrameContentParsingOperation {
        return ID3AttachedPictureFrameContentParsingOperation(
            id3FrameConfiguration: ID3FrameConfiguration(),
            pictureTypeAdapter: ID3PictureTypeAdapter(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration()
            )
        )
    }
}
