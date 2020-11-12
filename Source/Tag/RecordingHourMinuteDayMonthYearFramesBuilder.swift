//
//  RecordingHourMinuteDayMonthYearFramesBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

/**
 Protocol adopted by ID3Tag builders that support the .recordingDayMonth (TDAT), .recordingHourMinute (TIME)
 and  recordingYear (TYER) frames. At the moment of this writing this frame is supported
 by ID3Tag version 2 and version 3. You should not adopt/use this protocol.
 Use ID32v2TagBuilder and ID32v3TagBuilder to create a ID3Tag version 2 or version 3.
 */
public protocol RecordingHourMinuteDayMonthYearFramesBuilder where Self: ID32TagCommonStringFramesBuilder {
    /**
      Set the recordingDayMonth frame to be written by ID3TagEditor.
     
      - parameter frame: the recordingDayMonth frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func recordingDayMonth(frame: ID3FrameRecordingDayMonth) -> Self

    /**
      Set the recordingHourMinute frame to be written by ID3TagEditor.
     
      - parameter frame: the recordingHourMinute frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func recordingHourMinute(frame: ID3FrameRecordingHourMinute) -> Self

    /**
      Set the recordingYear frame to be written by ID3TagEditor.
     
      - parameter frame: the recordingYear frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func recordingYear(frame: ID3FrameWithIntegerContent) -> Self
}

public extension RecordingHourMinuteDayMonthYearFramesBuilder {
    /**
      Set the recordingDayMonth frame to be written by ID3TagEditor.
     
      - parameter frame: the recordingDayMonth frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func recordingDayMonth(frame: ID3FrameRecordingDayMonth) -> Self {
        frames[.recordingDayMonth] = frame
        return self
    }

    /**
      Set the recordingHourMinute frame to be written by ID3TagEditor.
     
      - parameter frame: the recordingHourMinute frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func recordingHourMinute(frame: ID3FrameRecordingHourMinute) -> Self {
        frames[.recordingHourMinute] = frame
        return self
    }

    /**
      Set the recordingYear frame to be written by ID3TagEditor.
     
      - parameter frame: the recordingYear frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    func recordingYear(frame: ID3FrameWithIntegerContent) -> Self {
        frames[.recordingYear] = frame
        return self
    }
}
