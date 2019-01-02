//
//  ID3TrackPositionCreator.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TrackPositionFrameCreator: ID3FrameCreatorsChain {
    private let frameCreator: FrameFromStringContentCreator
    private var id3FrameConfiguration: ID3FrameConfiguration

    init(frameCreator: FrameFromStringContentCreator, id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameCreator = frameCreator
        self.id3FrameConfiguration = id3FrameConfiguration
    }

    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let trackPosition = id3Tag.trackPosition {
            let newTag = tag +
                    frameCreator.createFrame(
                            frameIdentifier: id3FrameConfiguration.identifierFor(
                                    frameType: .TrackPosition,
                                    version: id3Tag.properties.version
                            ),
                            version: id3Tag.properties.version,
                            content: adapt(trackPosition: trackPosition)
                    )
            return super.createFrames(id3Tag: id3Tag, tag: newTag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }

    private func adapt(trackPosition: ID3FrameTrackPosition) -> String {
        var trackPositionString = String(trackPosition.position)
        if let validTotalTracks = trackPosition.totalTracks {
            trackPositionString = trackPositionString + "/\(validTotalTracks)"
        }
        return trackPositionString
    }
}
