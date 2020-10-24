//
//  ID32v4TagBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

public class ID32v4TagBuilder: TagBuilder {
    var frames: [FrameName: ID3Frame] = [:]

    public init() { }

    func recordingDateTime(frame: ID3FrameRecordingDateTime) -> ID32v4TagBuilder {
        return self
    }

    func build() -> ID3Tag {
        return ID3Tag(version: .version4, frames: frames)
    }
}
