//
//  ID32v4TagBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

/**
 Builder used to create a ID32v4 tag.
 It let the user set all the frames included in ID32TagCommonStringFramesBuilder, ID32TagCommonCompositeFramesBuilder,
 RecordingDateTimeFrameBuilder, FileOwnerFrameBuilder and ITunesFramesBuilder.
 */
public class ID32v4TagBuilder: ID32TagCommonCompositeFramesBuilder,
                               TagBuilder,
                               FileOwnerFrameBuilder,
                               ITunesFramesBuilder,
                               RecordingDateTimeFrameBuilder {
    /**
     Init a ID32v4TagBuilder instance.
     */
    override public init() {}

    /**
     Build and ID3Tag version 4.
     
      - returns: an ID3Tag version 4 instance to use with the write function of ID3TagEditor.
     */
    public func build() -> ID3Tag {
        return ID3Tag(version: .version4, frames: frames)
    }
}
