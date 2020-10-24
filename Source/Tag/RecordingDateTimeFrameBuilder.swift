//
//  RecordingDateTimeFrameBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

protocol RecordingDateTimeFrameBuilder: ID32TagCommonFramesBuilder {
    func recordingDateTime(frame: ID3FrameRecordingDateTime) -> Self
}

extension RecordingDateTimeFrameBuilder {
    func recordingDateTime(frame: ID3FrameRecordingDateTime) -> Self {
        frames[.recordingDateTime] = frame
        return self
    }
}
