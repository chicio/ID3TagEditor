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

    /**
     Init an attached picture.

     - parameter art: the image bytes as `Data`.
     - parameter isPNG: a flag to mark the image as PNG or not.
     */
    public init(art: Data, isPNG: Bool) {
        self.art = art
        self.isPNG = isPNG
    }
}
