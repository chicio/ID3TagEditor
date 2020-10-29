//
//  ID3RecordingYearFrameCreator.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3RecordingYearFrameCreator: ID3StringFrameCreator, ID3FrameCreator {
    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if id3Tag.properties.version < .version4,
            let yearFrame = id3Tag.frames[.recordingYear] as? ID3FrameRecordingYear,
            let year = yearFrame.year {
            return createFrameUsing(frameType: .recordingYear, content: String(year), id3Tag: id3Tag)
        }
        return []
    }
}
