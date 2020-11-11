//
//  ID3RecordingYearFrameCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 10.11.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3RecordingYearFrameCreator: ID3FrameCreator {
    private let frameCreator: FrameFromStringContentCreator

    init(frameCreator: FrameFromStringContentCreator) {
        self.frameCreator = frameCreator
    }

    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let yearFrame = id3Tag.frames[.recordingYear] as? ID3FrameRecordingYear,
            let year = yearFrame.year {
            return frameCreator.createFrame(
                     frameType: .recordingYear,
                     version: id3Tag.properties.version,
                     content: String(year)
             )
        }
        return []
    }
}
