//
//  ID32v4TagBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

public class ID32v4TagBuilder: ID32TagCommonCompositeFramesBuilder,
                               TagBuilder,
                               FileOwnerFrameBuilder,
                               ITunesFramesBuilder,
                               RecordingDateTimeFrameBuilder {
    override public init() {}

    public func build() -> ID3Tag {
        return ID3Tag(version: .version4, frames: frames)
    }
}
