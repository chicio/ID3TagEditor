//
//  TagBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

protocol TagBuilder {
    var frames: [FrameName: ID3Frame] { get set }
    func build() -> ID3Tag
}

extension TagBuilder {
    public mutating func title(frame: ID3FrameWithStringContent) {
        frames[.title] = frame
    }

    public mutating func album(frame: ID3FrameWithStringContent) {
        frames[.album] = frame
    }

    public mutating func albumArtist(frame: ID3FrameWithStringContent) {
        frames[.albumArtist] = frame
    }

    public mutating func artist(frame: ID3FrameWithStringContent) {
        frames[.artist] = frame
    }

    public mutating func composer(frame: ID3FrameWithStringContent) {
        frames[.composer] = frame
    }

    public mutating func conductor(frame: ID3FrameWithStringContent) {
        frames[.conductor] = frame
    }

    public mutating func contentGrouping(frame: ID3FrameWithStringContent) {
        frames[.contentGrouping] = frame
    }

    public mutating func copyright(frame: ID3FrameWithStringContent) {
        frames[.copyright] = frame
    }

    public mutating func encodedBy(frame: ID3FrameWithStringContent) {
        frames[.encodedBy] = frame
    }

    public mutating func encoderSettings(frame: ID3FrameWithStringContent) {
        frames[.encoderSettings] = frame
    }
}
