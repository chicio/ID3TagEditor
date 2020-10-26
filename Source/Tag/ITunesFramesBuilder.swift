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
public protocol ITunesFramesBuilder where Self: ID32TagCommonStringFramesBuilder {
    func iTunesGrouping(frame: ID3FrameWithStringContent) -> Self
    func iTunesMovementName(frame: ID3FrameWithStringContent) -> Self
    func iTunesMovementIndex(frame: ID3FrameWithIntegerContent) -> Self
    func iTunesMovementCount(frame: ID3FrameWithIntegerContent) -> Self
    func iTunesPodcastCategory(frame: ID3FrameWithStringContent) -> Self
    func iTunesPodcastDescription(frame: ID3FrameWithStringContent) -> Self
    func iTunesPodcastID(frame: ID3FrameWithStringContent) -> Self
    func iTunesPodcastKeywords(frame: ID3FrameWithStringContent) -> Self
}

/**
 Default implementation for all the adopters of ITunesFramesBuilder. This extension let the adopters of
 ITunesFramesBuilder set unofficial iTunes ad-hoc frames.
 */
public extension ITunesFramesBuilder {
    func iTunesGrouping(frame: ID3FrameWithStringContent) -> Self {
        frames[.iTunesGrouping] = frame
        return self
    }

    func iTunesMovementName(frame: ID3FrameWithStringContent) -> Self {
        frames[.iTunesMovementName] = frame
        return self
    }

    func iTunesMovementIndex(frame: ID3FrameWithIntegerContent) -> Self {
        frames[.iTunesMovementIndex] = frame
        return self
    }

    func iTunesMovementCount(frame: ID3FrameWithIntegerContent) -> Self {
        frames[.iTunesMovementCount] = frame
        return self
    }

    func iTunesPodcastCategory(frame: ID3FrameWithStringContent) -> Self {
        frames[.iTunesPodcastCategory] = frame
        return self
    }

    func iTunesPodcastDescription(frame: ID3FrameWithStringContent) -> Self {
        frames[.iTunesPodcastDescription] = frame
        return self
    }

    func iTunesPodcastID(frame: ID3FrameWithStringContent) -> Self {
        frames[.iTunesPodcastID] = frame
        return self
    }

    func iTunesPodcastKeywords(frame: ID3FrameWithStringContent) -> Self {
        frames[.iTunesPodcastKeywords] = frame
        return self
    }
}
