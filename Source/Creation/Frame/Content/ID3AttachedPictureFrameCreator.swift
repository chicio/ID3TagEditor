//
//  ID3AttachedPictureFrameCreator.swift
//
//  Created by Fabrizio Duroni on 12/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol AttachedPictureFrameCreator {
    func createFrame(using attachedPicture: ID3FrameAttachedPicture, id3Tag: ID3Tag) -> [UInt8]
}

class ID3AttachedPictureFrameCreator: AttachedPictureFrameCreator {
    private let id3FrameConfiguration: ID3FrameConfiguration
    private let id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration
    private let frameContentSizeCalculator: FrameContentSizeCalculator
    private let frameFlagsCreator: FrameFlagsCreator

    init(id3FrameConfiguration: ID3FrameConfiguration,
         id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration,
         frameContentSizeCalculator: FrameContentSizeCalculator,
         frameFlagsCreator: FrameFlagsCreator) {
        self.id3FrameConfiguration = id3FrameConfiguration
        self.id3AttachedPictureFrameConfiguration = id3AttachedPictureFrameConfiguration
        self.frameContentSizeCalculator = frameContentSizeCalculator
        self.frameFlagsCreator = frameFlagsCreator
    }

    func createFrame(using attachedPicture: ID3FrameAttachedPicture, id3Tag: ID3Tag) -> [UInt8] {
        var frame: [UInt8] = id3FrameConfiguration.identifierFor(
                frameType: .AttachedPicture,
                version: id3Tag.properties.version
        )
        var contentAsBytes: [UInt8] = [UInt8]()
        contentAsBytes.append(contentsOf: getAttachedPictureHeaderFor(
                attachedPicture: attachedPicture,
                version: id3Tag.properties.version,
                format: attachedPicture.format
        ))
        contentAsBytes.append(contentsOf: [UInt8](attachedPicture.picture));
        frame.append(contentsOf: frameContentSizeCalculator.calculateSizeOf(
                content: contentAsBytes,
                version: id3Tag.properties.version
        ))
        frame.append(contentsOf: frameFlagsCreator.createFor(version: id3Tag.properties.version))
        frame.append(contentsOf: contentAsBytes)
        return frame
    }

    private func getAttachedPictureHeaderFor(attachedPicture: ID3FrameAttachedPicture,
                                             version: ID3Version,
                                             format: ID3PictureFormat) -> [UInt8] {
        var header = id3AttachedPictureFrameConfiguration.getHeaderMimeTypeFor(pictureFormat: format, version: version)
        let coverTypeBytePosition = id3AttachedPictureFrameConfiguration.getPictureTypeBytePositionFor(
                pictureFormat: format,
                version: version
        )
        header[coverTypeBytePosition] = attachedPicture.type.rawValue
        return header
    }
}
