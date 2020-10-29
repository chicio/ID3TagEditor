//
//  ID3DiscPositionCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3DiscPositionFrameCreator: ID3FrameCreator {
    private let frameCreator: FrameFromStringContentCreator
    private var id3FrameConfiguration: ID3FrameConfiguration

    init(frameCreator: FrameFromStringContentCreator, id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameCreator = frameCreator
        self.id3FrameConfiguration = id3FrameConfiguration
    }

    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let discPositionFrame = id3Tag.frames[.discPosition] as? ID3FramePartOfTotal {
            return frameCreator.createFrame(
                    frameType: .discPosition,
                    version: id3Tag.properties.version,
                    content: adapt(discPosition: discPositionFrame)
            )
        }
        return []
    }

    private func adapt(discPosition: ID3FramePartOfTotal) -> String {
        var discPositionString = String(discPosition.part)
        if let validTotalDiscs = discPosition.total {
            discPositionString += "/\(validTotalDiscs)"
        }
        return discPositionString
    }
}
