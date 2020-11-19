//
//  ITunesFramesBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

/**
 Protocol adopted by ID3Tag builders that support the unofficial iTunes ad-hoc frames. At the
 moment of this writing only ID3Tag version 3 and 4 support these frames. You should not adopt/use this protocol.
 Use ID32v3TagBuilder and ID32v4TagBuilder to create an ID3Tag with this frames.
 */
public protocol ITunesFramesBuilder where Self: ID32TagCommonFramesBuilder {
    /**
      Set the iTunesGrouping frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesGrouping frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func iTunesGrouping(frame: ID3FrameWithStringContent) -> Self

    /**
      Set the iTunesGrouping frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesMovementName frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func iTunesMovementName(frame: ID3FrameWithStringContent) -> Self

    /**
      Set the iTunesMovementIndex frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesMovementIndex frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func iTunesMovementIndex(frame: ID3FrameWithIntegerContent) -> Self

    /**
      Set the iTunesMovementCount frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesMovementCount frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func iTunesMovementCount(frame: ID3FrameWithIntegerContent) -> Self

    /**
      Set the iTunesPodcastCategory frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesPodcastCategory frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func iTunesPodcastCategory(frame: ID3FrameWithStringContent) -> Self

    /**
      Set the iTunesPodcastDescription frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesPodcastDescription frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func iTunesPodcastDescription(frame: ID3FrameWithStringContent) -> Self

    /**
      Set the iTunesPodcastID frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesPodcastID frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func iTunesPodcastID(frame: ID3FrameWithStringContent) -> Self

    /**
      Set the iTunesPodcastKeywords frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesPodcastKeywords frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func iTunesPodcastKeywords(frame: ID3FrameWithStringContent) -> Self
}

/**
 Default implementation for all the adopters of ITunesFramesBuilder. This extension let the adopters of
 ITunesFramesBuilder set unofficial iTunes ad-hoc frames.
 */
public extension ITunesFramesBuilder {
    /**
      Set the iTunesGrouping frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesGrouping frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func iTunesGrouping(frame: ID3FrameWithStringContent) -> Self {
        frames[.iTunesGrouping] = frame
        return self
    }

    /**
      Set the iTunesGrouping frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesMovementName frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func iTunesMovementName(frame: ID3FrameWithStringContent) -> Self {
        frames[.iTunesMovementName] = frame
        return self
    }

    /**
      Set the iTunesMovementIndex frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesMovementIndex frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func iTunesMovementIndex(frame: ID3FrameWithIntegerContent) -> Self {
        frames[.iTunesMovementIndex] = frame
        return self
    }

    /**
      Set the iTunesMovementCount frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesMovementCount frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func iTunesMovementCount(frame: ID3FrameWithIntegerContent) -> Self {
        frames[.iTunesMovementCount] = frame
        return self
    }

    /**
      Set the iTunesPodcastCategory frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesPodcastCategory frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func iTunesPodcastCategory(frame: ID3FrameWithStringContent) -> Self {
        frames[.iTunesPodcastCategory] = frame
        return self
    }

    /**
      Set the iTunesPodcastDescription frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesPodcastDescription frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func iTunesPodcastDescription(frame: ID3FrameWithStringContent) -> Self {
        frames[.iTunesPodcastDescription] = frame
        return self
    }

    /**
      Set the iTunesPodcastID frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesPodcastID frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func iTunesPodcastID(frame: ID3FrameWithStringContent) -> Self {
        frames[.iTunesPodcastID] = frame
        return self
    }

    /**
      Set the iTunesPodcastKeywords frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesPodcastKeywords frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func iTunesPodcastKeywords(frame: ID3FrameWithStringContent) -> Self {
        frames[.iTunesPodcastKeywords] = frame
        return self
    }
}
