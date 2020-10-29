//
//  ID3TrackPositionCreator.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TrackPositionFrameCreator: ID3FrameCreator {
    private let frameCreator: FrameFromStringContentCreator
    private var id3FrameConfiguration: ID3FrameConfiguration

    init(frameCreator: FrameFromStringContentCreator, id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameCreator = frameCreator
        self.id3FrameConfiguration = id3FrameConfiguration
    }

    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let trackPositionFrame = id3Tag.frames[.trackPosition] as? ID3FramePartOfTotal {
            return frameCreator.createFrame(
                    frameType: .trackPosition,
                    version: id3Tag.properties.version,
                    content: adapt(trackPosition: trackPositionFrame)
            )
        }
        return []
    }

    private func adapt(trackPosition: ID3FramePartOfTotal) -> String {
        var trackPositionString = String(trackPosition.part)
        if let validTotalTracks = trackPosition.total {
            trackPositionString += "/\(validTotalTracks)"
        }
        return trackPositionString
    }
}
