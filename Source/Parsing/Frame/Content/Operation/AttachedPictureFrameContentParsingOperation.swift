//
//  AttachedPictureFrameContentParsingOperation.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class AttachedPictureFrameContentParsingOperation: FrameContentParsingOperation {
    private let jpegMagicNumber: Data = Data(bytes: [0xFF, 0xD8, 0xFF, 0xE0])
    private let pngMagicNumber: Data =  Data(bytes: [0x89, 0x50, 0x4E, 0x47])
    private let id3FrameConfiguration: ID3FrameConfiguration
    private let pictureTypeAdapter: PictureTypeAdapter

    init(id3FrameConfiguration: ID3FrameConfiguration, pictureTypeAdapter: PictureTypeAdapter) {
        self.id3FrameConfiguration = id3FrameConfiguration
        self.pictureTypeAdapter = pictureTypeAdapter
    }

    func parse(frame: Data, id3Tag: ID3Tag) {
        parseToCheckIfThereIsAnImageUsing(magicNumber: jpegMagicNumber, format: .Jpeg, frame: frame, andSaveTo: id3Tag)
        parseToCheckIfThereIsAnImageUsing(magicNumber: pngMagicNumber, format: .Png, frame: frame, andSaveTo: id3Tag)
    }

    private func parseToCheckIfThereIsAnImageUsing(magicNumber: Data,
                                                   format: ID3PictureFormat,
                                                   frame: Data,
                                                   andSaveTo id3Tag: ID3Tag) {
        if let magicNumberRange = frame.range(of: magicNumber) {
            id3Tag.attachedPictures?.append(AttachedPicture(
                    art: frame.subdata(in: Range(magicNumberRange.lowerBound..<frame.count)),
                    type: pictureTypeAdapter.adapt(frame: frame, format: format, version: id3Tag.properties.version),
                    format: format
            ))
        }
    }
}
