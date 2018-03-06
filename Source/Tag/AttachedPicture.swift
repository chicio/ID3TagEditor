//
//  AttachedPicture.swift
//
//  Created by Fabrizio Duroni on 05/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A class used to represent an image to be used in the ID3 tag as attached picture.
 This class contains the data of an image to be saved in the tag.
 */
public struct AttachedPicture {
    /// The image bytes as `Data`.
    public var art: Data;
    /// A flag to mark the image as PNG or not.
    public var isPNG: Bool;
    /// The ID3 type of the image (see `ID3PictureType`).
    public var type: ID3PictureType

    /**
     Init an attached picture.

     - parameter art: the image bytes as `Data`.
     - parameter isPNG: a flag to mark the image as PNG or not.
     - parameter type: the ID3 type of the attached picture. See `ID3PictureType` for a complete list of the available
     types.
     */
    public init(art: Data, isPNG: Bool, type: ID3PictureType) {
        self.art = art
        self.isPNG = isPNG
        self.type = type
    }
}
