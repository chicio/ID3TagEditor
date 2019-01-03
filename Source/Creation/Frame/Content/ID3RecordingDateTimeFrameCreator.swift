//
//  ID3RecordingDateTimeFrameCreator.swift
//
//  Created by Fabrizio Duroni on 28/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3RecordingDateTimeFrameCreator: ID3StringFrameCreator {
    private let timestampCreator: TimestampCreator
    
    init(frameCreator: FrameFromStringContentCreator,
         id3FrameConfiguration: ID3FrameConfiguration,
         timestampCreator: TimestampCreator) {
        self.timestampCreator = timestampCreator
        super.init(frameCreator: frameCreator, id3FrameConfiguration: id3FrameConfiguration)
    }
    
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if id3Tag.properties.version >= .version4,
            let recordingDateTimeFrame = id3Tag.frames[.RecordingDateTime] as? ID3FrameRecordingDateTime,
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
            return createFrameUsing(frameType: .RecordingDateTime, content: timestamp, id3Tag: id3Tag, andAddItTo: tag)
        }
        
        if id3Tag.properties.version >= .version4,
            let recordingDateTime = id3Tag.recordingDateTime,
            let recordingYear = id3Tag.recordingDateTime?.date?.year {
                /**
                 Fallback case:
                 Same as of parsing operation. A lot mp3 id3 tag app place just the year inside this field instead of the
                 timestamp reccomended in the id3 standard. To avoid incompatibility with other id3 parser/writer we use as
                 fallback case the year: if the timestamp creator doesn't return a valid timestamp we just save the year
                 in this field (because most of the time people just want to save the recording year in the field :).
                 */
                let timestamp = timestampCreator.createFrom(recordingDateTime: recordingDateTime) ?? String(recordingYear)
                return createFrameUsing(frameType: .RecordingDateTime, content: timestamp, id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
