//
//  ID3TrackPositionCreator.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TrackPositionFrameCreator: ID3FrameCreator {
    private let frameCreator: FrameFromStringContentCreator

    init(frameCreator: FrameFromStringContentCreator) {
        self.frameCreator = frameCreator
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
