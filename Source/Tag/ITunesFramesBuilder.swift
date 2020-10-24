//
//  ITunesFramesBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

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
