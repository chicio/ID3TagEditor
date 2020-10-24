//
//  ID32TagCommonFramesBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni
//

import Foundation

public class ID32TagCommonFramesBuilder {
    var frames: [FrameName: ID3Frame] = [:]

    public func title(frame: ID3FrameWithStringContent) -> Self {
        frames[.title] = frame
        return self
    }

    public func album(frame: ID3FrameWithStringContent) -> Self {
        frames[.album] = frame
        return self
    }

    public func albumArtist(frame: ID3FrameWithStringContent) -> Self {
        frames[.albumArtist] = frame
        return self
    }

    public func artist(frame: ID3FrameWithStringContent) -> Self {
        frames[.artist] = frame
        return self
    }

    public func composer(frame: ID3FrameWithStringContent) -> Self {
        frames[.composer] = frame
        return self
    }

    public func conductor(frame: ID3FrameWithStringContent) -> Self {
        frames[.conductor] = frame
        return self
    }

    public func contentGrouping(frame: ID3FrameWithStringContent) -> Self {
        frames[.contentGrouping] = frame
        return self
    }

    public func copyright(frame: ID3FrameWithStringContent) -> Self {
        frames[.copyright] = frame
        return self
    }

    public func encodedBy(frame: ID3FrameWithStringContent) -> Self {
        frames[.encodedBy] = frame
        return self
    }

    public func encoderSettings(frame: ID3FrameWithStringContent) -> Self {
        frames[.encoderSettings] = frame
        return self
    }

    public func lyricist(frame: ID3FrameWithStringContent) -> Self {
        frames[.lyricist] = frame
        return self
    }

    public func mixArtist(frame: ID3FrameWithStringContent) -> Self {
        frames[.mixArtist] = frame
        return self
    }

    public func publisher(frame: ID3FrameWithStringContent) -> Self {
        frames[.publisher] = frame
        return self
    }

    public func subtitle(frame: ID3FrameWithStringContent) -> Self {
        frames[.subtitle] = frame
        return self
    }

    public func genre(frame: ID3FrameGenre) -> Self {
        frames[.genre] = frame
        return self
    }

    public func discPosition(frame: ID3FramePartOfTotal) -> Self {
        frames[.discPosition] = frame
        return self
    }

    public func trackPosition(frame: ID3FramePartOfTotal) -> Self {
        frames[.trackPosition] = frame
        return self
    }

    public func attachedPicture(pictureType: ID3PictureType, frame: ID3FrameAttachedPicture) -> Self {
        frames[.attachedPicture(pictureType)] = frame
        return self
    }

    public func unsynchronisedLyrics(language: ID3FrameContentLanguage,
                                     frame: ID3FrameUnsynchronisedLyrics) -> Self {
        frames[.unsynchronizedLyrics(language)] = frame
        return self
    }
}
