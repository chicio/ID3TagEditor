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

    init(id3FrameConfiguration: ID3FrameConfiguration) {
        self.id3FrameConfiguration = id3FrameConfiguration
    }

    func parse(frame: Data, id3Tag: ID3Tag) {
        parseToCheckThereIsAJpeg(id3Tag: id3Tag, frame: frame)
        parseToCheckIfThereIsAPng(id3Tag: id3Tag, frame: frame)
    }

    private func parseToCheckThereIsAJpeg(id3Tag: ID3Tag, frame: Data) {
        if let jpgMagicNumberRange = frame.range(of: jpegMagicNumber) {
            id3Tag.attachedPicture = AttachedPicture(
                    art: frame.subdata(in: Range(jpgMagicNumberRange.lowerBound..<frame.count)),
                    isPNG: false
            )
        }
    }

    private func parseToCheckIfThereIsAPng(id3Tag: ID3Tag, frame: Data) {
        if let pngMagicNumberRange = frame.range(of: pngMagicNumber) {
            id3Tag.attachedPicture = AttachedPicture(
                    art: frame.subdata(in: Range(pngMagicNumberRange.lowerBound..<frame.count)),
                    isPNG: true
            )
        }
    }
}
