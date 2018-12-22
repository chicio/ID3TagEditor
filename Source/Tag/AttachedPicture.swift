//
//  AttachedPicture.swift
//
//  Created by Fabrizio Duroni on 05/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A struct used to represent an image as attached picture for the ID3 tag.
 */
public struct AttachedPicture: Equatable {
    /// The image bytes as `Data`.
    public var picture: Data;
    /// The ID3 type of the image (see `ID3PictureType`).
    public var type: ID3PictureType
    /// The file format. Only Jpeg and Png are supported by the standard (cross compatibility).
    public var format: ID3PictureFormat
    
    public var description: String {
        return "\(type) \(format)"
    }

    /**
     Init an attached picture.

     - parameter picture: the image bytes as `Data`.
     - parameter type: the ID3 type of the attached picture. See `ID3PictureType` for a complete list of the available.
     - parameter format: the format of the image. See `ID3PictureFormat`.
     types.
     */
    public init(picture: Data, type: ID3PictureType, format: ID3PictureFormat) {
        self.picture = picture
        self.type = type
        self.format = format
    }

    /**
     Compare two AttachedPicture.

     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.

     - returns: true if the attached pictures values are the same, else false.
     */
    public static func ==(lhs: AttachedPicture, rhs: AttachedPicture) -> Bool {
        return lhs.picture == rhs.picture && lhs.format == rhs.format && lhs.type == rhs.type
    }
}
