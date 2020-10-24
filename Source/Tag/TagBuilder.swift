//
//  TagBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

protocol TagBuilder: AnyObject {
    var frames: [FrameName: ID3Frame] { get set }
    func build() -> ID3Tag
}

extension TagBuilder {
    public func title(frame: ID3FrameWithStringContent) -> TagBuilder {
        frames[.title] = frame
        return self
    }

    public func album(frame: ID3FrameWithStringContent) -> TagBuilder {
        frames[.album] = frame
        return self
    }

    public func albumArtist(frame: ID3FrameWithStringContent) -> TagBuilder {
        frames[.albumArtist] = frame
        return self
    }

    public func artist(frame: ID3FrameWithStringContent) -> TagBuilder {
        frames[.artist] = frame
        return self
    }

    public func composer(frame: ID3FrameWithStringContent) -> TagBuilder {
        frames[.composer] = frame
        return self
    }

    public func conductor(frame: ID3FrameWithStringContent) -> TagBuilder {
        frames[.conductor] = frame
        return self
    }

    public func contentGrouping(frame: ID3FrameWithStringContent) -> TagBuilder {
        frames[.contentGrouping] = frame
        return self
    }

    public func copyright(frame: ID3FrameWithStringContent) -> TagBuilder {
        frames[.copyright] = frame
        return self
    }

    public func encodedBy(frame: ID3FrameWithStringContent) -> TagBuilder {
        frames[.encodedBy] = frame
        return self
    }

    public func encoderSettings(frame: ID3FrameWithStringContent) -> TagBuilder {
        frames[.encoderSettings] = frame
        return self
    }

    public func lyricist(frame: ID3FrameWithStringContent) -> TagBuilder {
        frames[.lyricist] = frame
        return self
    }

//    case mixArtist
//    /// Publisher frame name.
//    case publisher
//    /// Subtitle frame name
//    case subtitle
//    /// Genre frame name.
//    case genre
//    /// Disc Position frame name.
//    case discPosition
//    /// Track Position frame name.
//    case trackPosition
//    case attachedPicture(_ pictureType: ID3PictureType)
//    /// Unsynchronized lyrics frame name
//    /// - language: language of the lyrics, according to the ISO-639-2 standard
//    case unsynchronizedLyrics(_ language: ID3FrameContentLanguage)
}
