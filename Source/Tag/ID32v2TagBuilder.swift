//
//  ID32v2TagBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

public class ID32v2TagBuilder: ID32TagCommonFramesBuilder, TagBuilder, RecordingHourMinuteDayMonthYearFramesBuilder {
    override public init() {}

    public func build() -> ID3Tag {
        return ID3Tag(version: .version2, frames: frames)
    }
}
