//
//  ID32v3TagBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

/**
 Builder used to create a ID32v3 tag.
 It let the user set all the frames included in ID32TagCommonStringFramesBuilder, ID32TagCommonCompositeFramesBuilder,
 RecordingHourMinuteDayMonthYearFramesBuilder, FileOwnerFrameBuilder and ITunesFramesBuilder.
 */
public class ID32v3TagBuilder: ID32TagCommonCompositeFramesBuilder,
                               TagBuilder,
                               RecordingHourMinuteDayMonthYearFramesBuilder,
                               FileOwnerFrameBuilder,
                               ITunesFramesBuilder {
    /**
     Init a ID32v3TagBuilder instance.
     */
    override public init() {}

    /**
     Build and ID3Tag version 3.
     
      - returns: an ID3Tag version 3 instance to use with the write function of ID3TagEditor.
     */
    public func build() -> ID3Tag {
        return ID3Tag(version: .version3, frames: frames)
    }
}
