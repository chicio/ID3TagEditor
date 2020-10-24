//
//  ID32v2TagBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

public class ID32v2TagBuilder: TagBuilder {
    var frames: [FrameName: ID3Frame] = [:]

    func title(frame: ID3FrameWithStringContent) {
        frames[.title] = frame
    }

    func album(frame: ID3FrameWithStringContent) {
        frames[.album] = frame
    }

    func albumArtist(frame: ID3FrameWithStringContent) {
        frames[.albumArtist] = frame
    }

    func build() -> ID3Tag {
        return ID3Tag(version: .version2, frames: frames)
    }
}
