//
//  ID3RecordingDateTimeFrameCreator.swift
//
//  Created by Fabrizio Duroni on 28/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3RecordingDateTimeFrameCreator: ID3FrameCreator {
    private let timestampCreator: TimestampCreator
    private let frameCreator: FrameFromStringContentCreator

    init(frameCreator: FrameFromStringContentCreator,
         timestampCreator: TimestampCreator) {
        self.timestampCreator = timestampCreator
        self.frameCreator = frameCreator
    }

    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let recordingDateTimeFrame = id3Tag.frames[.recordingDateTime] as? ID3FrameRecordingDateTime,
           let recordingYear = recordingDateTimeFrame.recordingDateTime.date?.year {
            /**
             Fallback case:
             Same as of parsing operation. A lot mp3 id3 tag app place just the year inside this field instead of the
             timestamp reccomended in the id3 standard. To avoid incompatibility with other id3 parser/writer we use as
             fallback case the year: if the timestamp creator doesn't return a valid timestamp we just save the year
             in this field (because most of the time people just want to save the recording year in the field :).
             */
            let timestamp = timestampCreator
                .createFrom(recordingDateTime: recordingDateTimeFrame.recordingDateTime) ?? String(recordingYear)
            return frameCreator.createFrame(
                frameType: .recordingDateTime,
                version: id3Tag.properties.version,
                content: timestamp
            )
        }
        return []
    }
}
