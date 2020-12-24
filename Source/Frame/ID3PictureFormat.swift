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
    public typealias AllCases = [ID3PictureFormat]
    public static var allCases: AllCases {
        return [.jpeg, .png, .nonStandard(Data([0, 0, 0, 0]))]
    }

    /// Jpeg image.
    case jpeg
    /// Png image.
    case png
    /// Any other type of image file; associated value is the 4-byte Magic Number of the file type.
    case nonStandard(Data)
}
