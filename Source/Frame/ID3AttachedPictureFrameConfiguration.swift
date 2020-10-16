//
//  ID3AttachedPictureFrameConfiguration.swift
//
//  Created by Fabrizio Duroni on 06/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3AttachedPictureFrameConfiguration {
    private let commonFrameCoverTypeBytePosition: [ID3PictureFormat: Int] = [
        .png: 11,
        .jpeg: 12
    ]
    private var frameCoverTypeBytePosition: [ID3Version: [ID3PictureFormat: Int]] = [
        .version2: [
            .png: 4,
            .jpeg: 4
        ]
    ]
    private let commonFrameHeaderMimeTypeHeader: [ID3PictureFormat: [UInt8]] = [
        .png: [0x00] + [UInt8]("image/png".utf8) + [0x00, 0x03, 0x00],
        .jpeg: [0x00] + [UInt8]("image/jpeg".utf8) + [0x00, 0x03, 0x00]
    ]
    private var frameHeaderMimeTypeHeader: [ID3Version: [ID3PictureFormat: [UInt8]]] = [
        .version2: [
            .png: [0x00] + [UInt8]("PNG".utf8) + [0x03, 0x00],
            .jpeg: [0x00] + [UInt8]("JPG".utf8) + [0x03, 0x00]
        ]
    ]

    init() {
        self.frameCoverTypeBytePosition[.version3] = commonFrameCoverTypeBytePosition
        self.frameCoverTypeBytePosition[.version4] = commonFrameCoverTypeBytePosition
        self.frameHeaderMimeTypeHeader[.version3] = commonFrameHeaderMimeTypeHeader
        self.frameHeaderMimeTypeHeader[.version4] = commonFrameHeaderMimeTypeHeader
    }

    func getHeaderMimeTypeFor(pictureFormat: ID3PictureFormat, version: ID3Version) -> [UInt8] {
        return frameHeaderMimeTypeHeader[version]![pictureFormat]!
    }

    func getPictureTypeBytePositionFor(pictureFormat: ID3PictureFormat, version: ID3Version) -> Int {
        return frameCoverTypeBytePosition[version]![pictureFormat]!
    }
}
