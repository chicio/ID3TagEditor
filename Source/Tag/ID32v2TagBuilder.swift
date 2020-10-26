//
//  ID32v2TagBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

/**
 Builder used to create a ID32v2 tag.
 It let the user set all the frames included in ID32TagCommonStringFramesBuilder,
 ID32TagCommonCompositeFramesBuilder and RecordingHourMinuteDayMonthYearFramesBuilder.
 */
public class ID32v2TagBuilder: ID32TagCommonCompositeFramesBuilder,
                               TagBuilder,
                               RecordingHourMinuteDayMonthYearFramesBuilder {
    /**
     Init a ID32v2TagBuilder instance.
     */
    override public init() {}

    /**
     Build and ID3Tag version 2.
     
      - returns: an ID3Tag version 2 instance to use with the write function of ID3TagEditor.
     */
    public func build() -> ID3Tag {
        return ID3Tag(version: .version2, frames: frames)
    }
}
