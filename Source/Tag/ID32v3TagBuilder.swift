//
//  ID32v3TagBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

public class ID32v3TagBuilder: ID32TagCommonCompositeFramesBuilder,
                               TagBuilder,
                               RecordingHourMinuteDayMonthYearFramesBuilder,
                               FileOwnerFrameBuilder,
                               ITunesFramesBuilder {
    override public init() {}

    public func build() -> ID3Tag {
        return ID3Tag(version: .version3, frames: frames)
    }
}
