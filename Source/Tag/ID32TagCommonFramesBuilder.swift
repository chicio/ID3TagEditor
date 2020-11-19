//
//  ID32TagCommonFramesBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

/**
 This is the base common class of all ID3 Tag builder. ID32v2TagBuilder, ID32v3TagBuilder and
 ID32v4TagBuilder inherits from this class. It let the user set the basic frame (string or integer) that are in
 common to all the ID3 v2 tag specificiation. This class can't be used in user code.
 Use of ID32v2TagBuilder, ID32v3TagBuilder and ID32v4TagBuilder classes.
 */
public class ID32TagCommonFramesBuilder {
    var frames: [FrameName: ID3Frame] = [:]

    /**
      Set the title frame to be written by ID3TagEditor.
     
      - parameter frame: the title frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func title(frame: ID3FrameWithStringContent) -> Self {
        frames[.title] = frame
        return self
    }

    /**
      Set the album frame to be written by ID3TagEditor.
     
      - parameter frame: the album frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func album(frame: ID3FrameWithStringContent) -> Self {
        frames[.album] = frame
        return self
    }

    /**
      Set the albumArtist frame to be written by ID3TagEditor.
     
      - parameter frame: the albumArtist frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func albumArtist(frame: ID3FrameWithStringContent) -> Self {
        frames[.albumArtist] = frame
        return self
    }

    /**
      Set the artist frame to be written by ID3TagEditor.
     
      - parameter frame: the artist frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func artist(frame: ID3FrameWithStringContent) -> Self {
        frames[.artist] = frame
        return self
    }

    /**
      Set the composer frame to be written by ID3TagEditor.
     
      - parameter frame: the composer frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func composer(frame: ID3FrameWithStringContent) -> Self {
        frames[.composer] = frame
        return self
    }

    /**
      Set the conductor frame to be written by ID3TagEditor.
     
      - parameter frame: the conductor frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func conductor(frame: ID3FrameWithStringContent) -> Self {
        frames[.conductor] = frame
        return self
    }

    /**
      Set the contentGrouping frame to be written by ID3TagEditor.
     
      - parameter frame: the contentGrouping frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func contentGrouping(frame: ID3FrameWithStringContent) -> Self {
        frames[.contentGrouping] = frame
        return self
    }

    /**
      Set the copyright frame to be written by ID3TagEditor.
     
      - parameter frame: the copyright frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func copyright(frame: ID3FrameWithStringContent) -> Self {
        frames[.copyright] = frame
        return self
    }

    /**
      Set the encodedBy frame to be written by ID3TagEditor.
     
      - parameter frame: the encodedBy frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func encodedBy(frame: ID3FrameWithStringContent) -> Self {
        frames[.encodedBy] = frame
        return self
    }

    /**
      Set the encoderSettings frame to be written by ID3TagEditor.
     
      - parameter frame: the encoderSettings frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func encoderSettings(frame: ID3FrameWithStringContent) -> Self {
        frames[.encoderSettings] = frame
        return self
    }

    /**
      Set the lyricist frame to be written by ID3TagEditor.
     
      - parameter frame: the lyricist frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func lyricist(frame: ID3FrameWithStringContent) -> Self {
        frames[.lyricist] = frame
        return self
    }

    /**
      Set the mixArtist frame to be written by ID3TagEditor.
     
      - parameter frame: the mixArtist frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func mixArtist(frame: ID3FrameWithStringContent) -> Self {
        frames[.mixArtist] = frame
        return self
    }

    /**
      Set the publisher frame to be written by ID3TagEditor.
     
      - parameter frame: the publisher frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func publisher(frame: ID3FrameWithStringContent) -> Self {
        frames[.publisher] = frame
        return self
    }

    /**
      Set the subtitle frame to be written by ID3TagEditor.
     
      - parameter frame: the subtitle frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func subtitle(frame: ID3FrameWithStringContent) -> Self {
        frames[.subtitle] = frame
        return self
    }

    /**
      Set the beats per minute frame to be written by ID3TagEditor.
     
      - parameter frame: the beats per minute frame as a ID3FrameWithIntegerContent instance.
     
      - returns: the instance of the builder.
     */
    public func beatsPerMinute(frame: ID3FrameWithIntegerContent) -> Self {
        frames[.beatsPerMinute] = frame
        return self
    }
}
