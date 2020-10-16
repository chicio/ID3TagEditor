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
    /// Jpeg image.
    case jpeg
    /// Png image.
    case png
}
