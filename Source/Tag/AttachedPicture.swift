//
//  AttachedPicture.swift
//
//  Created by Fabrizio Duroni on 05/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A class used to represent an image as attached picture for the ID3 tag.
 */
public struct AttachedPicture {
    /// The image bytes as `Data`.
    public var art: Data;
    /// The ID3 type of the image (see `ID3PictureType`).
    public var type: ID3PictureType
    /// The file format. Only Jpeg and Png are supported by the standard (cross compatibility).
    public var format: AttachedPictureFormat

    /**
     Init an attached picture.

     - parameter art: the image bytes as `Data`.
     - parameter type: the ID3 type of the attached picture. See `ID3PictureType` for a complete list of the available.
     - parameter format: the format of the image. See `AttachedPictureFormat`.
     types.
     */
    public init(art: Data, type: ID3PictureType, format: AttachedPictureFormat) {
        self.art = art
        self.type = type
        self.format = format
    }
}
