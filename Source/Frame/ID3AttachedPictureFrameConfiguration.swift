//
//  ID3AttachedPictureFrameConfiguration.swift
//
//  Created by Fabrizio Duroni on 06/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3AttachedPictureFrameConfiguration {
    private let frameCoverTypeBytePosition: [ID3Version : [ID3PictureFormat : Int]] = [
        .version2 : [
            .Png : 4,
            .Jpeg : 4
        ],
        .version3 : [
            .Png : 11,
            .Jpeg : 12
        ]
    ]
    private let frameHeaderMimeTypeHeader: [ID3Version : [ID3PictureFormat : [UInt8]]] = [
        .version2 : [
            .Png : [0x00] + [UInt8]("PNG".utf8) + [0x03, 0x00],
            .Jpeg : [0x00] + [UInt8]("JPG".utf8) + [0x03, 0x00]
        ],
        .version3 : [
            .Png : [0x00] + [UInt8]("image/png".utf8) + [0x00, 0x03, 0x00],
            .Jpeg : [0x00] + [UInt8]("image/jpeg".utf8) + [0x00, 0x03, 0x00]
        ]
    ]

    func getHeaderMimeTypeFor(pictureFormat: ID3PictureFormat, version: ID3Version) -> [UInt8] {
        return frameHeaderMimeTypeHeader[version]![pictureFormat]!
    }

    func getPictureTypeBytePositionFor(pictureFormat: ID3PictureFormat, version: ID3Version) -> Int {
        return frameCoverTypeBytePosition[version]![pictureFormat]!
    }
}
