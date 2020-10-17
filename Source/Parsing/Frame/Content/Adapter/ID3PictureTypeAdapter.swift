//
//  ID3PictureTypeAdapter.swift
//
//  Created by Fabrizio Duroni on 06/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3PictureTypeAdapter: PictureTypeAdapter {
    private let id3FrameConfiguration: ID3FrameConfiguration
    private let id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration

    init(id3FrameConfiguration: ID3FrameConfiguration,
         id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration) {
        self.id3FrameConfiguration = id3FrameConfiguration
        self.id3AttachedPictureFrameConfiguration = id3AttachedPictureFrameConfiguration
    }

    func adapt(frame: Data, format: ID3PictureFormat, version: ID3Version) -> ID3PictureType {
        let pictureTypeBytePosition = id3FrameConfiguration.headerSizeFor(version: version) +
                id3AttachedPictureFrameConfiguration.getPictureTypeBytePositionFor(
                        pictureFormat: format,
                        version: version
                )
        let pictureTypeByte = [UInt8](frame.subdata(in: pictureTypeBytePosition..<pictureTypeBytePosition + 1))
        if pictureTypeByte.count > 0,
           let pictureType = ID3PictureType(rawValue: pictureTypeByte[0]) {
            return pictureType
        }
        return .other
    }
}
