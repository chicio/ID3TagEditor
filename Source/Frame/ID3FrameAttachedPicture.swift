//
//  ID3FrameAttachedPicture.swift
//
//  Created by Fabrizio Duroni on 05/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A class used to represent an ID3 attached picture frame to be used in the ID3 tag.
 */
public class ID3FrameAttachedPicture: ID3Frame, Equatable, CustomDebugStringConvertible {
    /// The image bytes as `Data`.
    public let picture: Data
    /// The ID3 type of the image (see `ID3PictureType`).
    public let type: ID3PictureType
    /// The file format. Only Jpeg and Png are supported by the standard (cross compatibility).
    public let format: ID3PictureFormat
    /// ID3FrameAttachedPicture debug description.
    public var debugDescription: String {
        return "\(type) \(format)"
    }

    /**
     Init an ID3 attached picture frame.

     - parameter picture: the image bytes as `Data`.
     - parameter type: the ID3 type of the attached picture. See `ID3PictureType`
     for a complete list of the available picture types.
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
    public static func == (lhs: ID3FrameAttachedPicture, rhs: ID3FrameAttachedPicture) -> Bool {
        return lhs.picture == rhs.picture && lhs.format == rhs.format && lhs.type == rhs.type
    }
}
