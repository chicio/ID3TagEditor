//
//  ID3SeriesIndexFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3SeriesIndexFrameCreator: ID3FrameCreatorsChain {
    private let frameCreator: FrameFromStringContentCreator
    private var id3FrameConfiguration: ID3FrameConfiguration

    init(frameCreator: FrameFromStringContentCreator, id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameCreator = frameCreator
        self.id3FrameConfiguration = id3FrameConfiguration
    }

    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let seriesIndexFrame = id3Tag.frames[.SeriesIndex] as? ID3FrameSeriesIndex {
            let newTag = tag +
                frameCreator.createFrame(
                    frameIdentifier: id3FrameConfiguration.identifierFor(
                        frameType: .SeriesIndex,
                        version: id3Tag.properties.version
                    ),
                    version: id3Tag.properties.version,
                    content: adapt(seriesIndex: seriesIndexFrame)
            )
            return super.createFrames(id3Tag: id3Tag, tag: newTag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }

    private func adapt(seriesIndex: ID3FrameSeriesIndex) -> String {
        var seriesIndexString = String(seriesIndex.index)
        if let validTotalBooks = seriesIndex.totalBooks {
            seriesIndexString = seriesIndexString + "/\(validTotalBooks)"
        }
        return seriesIndexString
    }
}
