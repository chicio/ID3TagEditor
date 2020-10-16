//
//  ID3AttachedPictureFrameContentParsingOperation.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3AttachedPictureFrameContentParsingOperation: FrameContentParsingOperation {
    private let jpegMagicNumber: Data = Data([0xFF, 0xD8, 0xFF, 0xE0])
    private let pngMagicNumber: Data =  Data([0x89, 0x50, 0x4E, 0x47])
    private let id3FrameConfiguration: ID3FrameConfiguration
    private let pictureTypeAdapter: PictureTypeAdapter

    init(id3FrameConfiguration: ID3FrameConfiguration, pictureTypeAdapter: PictureTypeAdapter) {
        self.id3FrameConfiguration = id3FrameConfiguration
        self.pictureTypeAdapter = pictureTypeAdapter
    }

    func parse(frame: Data, version: ID3Version, completed: (FrameName, ID3Frame) -> Void) {
        parseToCheckIfThereIsAnImageUsing(magicNumber: jpegMagicNumber,
                                          format: .jpeg,
                                          frame: frame,
                                          version: version,
                                          completed: completed)
        parseToCheckIfThereIsAnImageUsing(magicNumber: pngMagicNumber,
                                          format: .png,
                                          frame: frame,
                                          version: version,
                                          completed: completed)
    }

    private func parseToCheckIfThereIsAnImageUsing(magicNumber: Data,
                                                   format: ID3PictureFormat,
                                                   frame: Data,
                                                   version: ID3Version,
                                                   completed: (FrameName, ID3Frame) -> Void) {
        if let magicNumberRange = frame.range(of: magicNumber) {
            let pictureType = pictureTypeAdapter.adapt(frame: frame, format: format, version: version)
            let attachedPictureFrame = ID3FrameAttachedPicture(
                picture: frame.subdata(in: magicNumberRange.lowerBound..<frame.count),
                type: pictureType,
                format: format
            )
            completed(.attachedPicture(pictureType), attachedPictureFrame)
        }
    }
}
