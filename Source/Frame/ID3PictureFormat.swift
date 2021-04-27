//
//  ID3PictureFormat.swift
//
//  Created by Fabrizio Duroni on 09/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 The attached picture format supported by the ID3 tag.
 */
public enum ID3PictureFormat: Equatable, Hashable, CaseIterable {
    // Magic file numbers for standard attached picture image formats
    public static let standardImageFormats: [ID3PictureFormat: Data] = [
        .jpeg: Data([0xFF, 0xD8, 0xFF, 0xE0]),
        .png: Data([0x89, 0x50, 0x4E, 0x47])
    ]
    /// Jpeg image.
    case jpeg
    /// Png image.
    case png
    /// Any other type of image file.
    case nonStandard
}
