//
//  ID3TagReaderContent.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 03.02.22.
//  Copyright © 2022 Fabrizio Duroni. All rights reserved.
//

import Foundation

public struct Genre: Equatable {
    public let identifier: ID3Genre?
    public let description: String?
}

public struct PartOfTotal: Equatable {
    public let position: Int
    public let total: Int?
}

public struct DayMonth: Equatable {
    public let day: Int?
    public let month: Int?
}

public struct HourMinute: Equatable {
    public let hour: Int?
    public let minute: Int?
}

public struct AttachedPicture: Equatable {
    /// The image bytes as `Data`.
    public let picture: Data
    public let format: ID3PictureFormat
    public let type: ID3PictureType
}

public struct LocalizedContent: Equatable {
    /// The language of the localized content
    public let language: ID3FrameContentLanguage
    /// A short description of the localized content
    public let contentDescription: String
    /// The content localized
    public let content: String
}
