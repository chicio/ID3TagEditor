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
    private let frameHeaderCreator: FrameHeaderCreator

    init(id3FrameConfiguration: ID3FrameConfiguration,
         id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration,
         frameHeaderCreator: FrameHeaderCreator) {
        self.id3FrameConfiguration = id3FrameConfiguration
        self.id3AttachedPictureFrameConfiguration = id3AttachedPictureFrameConfiguration
        self.frameHeaderCreator = frameHeaderCreator
    }

    func createFrame(using attachedPicture: ID3FrameAttachedPicture, id3Tag: ID3Tag) -> [UInt8] {
        let frameBody = getFrameBody(attachedPicture: attachedPicture, id3Tag: id3Tag)
        let frameHeader = frameHeaderCreator.createUsing(
            version: id3Tag.properties.version,
            frameType: .attachedPicture,
            frameBody: frameBody
        )
        return frameHeader + frameBody
    }

    private func getFrameBody(attachedPicture: ID3FrameAttachedPicture, id3Tag: ID3Tag) -> [UInt8] {
        var frameBody: [UInt8] = [UInt8]()
        frameBody.append(contentsOf: getAttachedPictureHeaderFor(
                attachedPicture: attachedPicture,
                version: id3Tag.properties.version,
                format: attachedPicture.format
        ))
        frameBody.append(contentsOf: [UInt8](attachedPicture.picture))
        return frameBody
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
