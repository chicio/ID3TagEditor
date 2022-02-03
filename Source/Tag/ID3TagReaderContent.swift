//
//  ID3TagReaderContent.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 03.02.22.
//  Copyright © 2022 Fabrizio Duroni. All rights reserved.
//

import Foundation

struct Genre: Equatable {
    public let identifier: ID3Genre?
    public let description: String?
}

struct PartOfTotal: Equatable {
    public let position: Int
    public let total: Int?
}

struct DayMonth: Equatable {
    public let day: Int?
    public let month: Int?
}

struct HourMinute: Equatable {
    public let hour: Int?
    public let minute: Int?
}

struct AttachedPicture: Equatable {
    /// The image bytes as `Data`.
    public let picture: Data
    public let format: ID3PictureFormat
    public let type: ID3PictureType
}
