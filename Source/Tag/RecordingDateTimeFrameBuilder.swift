//
//  RecordingDateTimeFrameBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

/**
 Protocol adopted by ID3Tag builders that support the .recordingDateTime (TDRC) frame. At the
 moment of this writing only ID3Tag version 4 support this frame. You should not adopt/use this protocol.
 Use ID32v4TagBuilder to create a ID3Tag version 4.
 */
public protocol RecordingDateTimeFrameBuilder: ID32TagCommonStringFramesBuilder {
    /**
      Set the recordingDateTime frame to be written by ID3TagEditor.
     
      - parameter frame: the recordingDateTime frame as a ID3FrameRecordingDateTime instance.
     
      - returns: the instance of the builder.
     */
    func recordingDateTime(frame: ID3FrameRecordingDateTime) -> Self
}

/**
 Default implementation for all the adopters of RecordingDateTimeFrameBuilder. This extension let the adopters of
 RecordingDateTimeFrameBuilder set the .recordingDateTime (TDRC) frame.
 */
public extension RecordingDateTimeFrameBuilder {
    /**
      Set the recordingDateTime frame to be written by ID3TagEditor.
     
      - parameter frame: the recordingDateTime frame as a ID3FrameRecordingDateTime instance.
     
      - returns: the instance of the builder.
     */
    func recordingDateTime(frame: ID3FrameRecordingDateTime) -> Self {
        frames[.recordingDateTime] = frame
        return self
    }
}
