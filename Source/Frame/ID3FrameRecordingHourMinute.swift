//
//  ID3FrameRecordingHourMinute.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 02.01.19.
//  Copyright © 2019 Fabrizio Duroni. All rights reserved.
//

import Foundation

public class ID3FrameRecordingHourMinute: ID3Frame, CustomDebugStringConvertible {
    /// Recording hour of the song.
    public let hour: Int?
    /// Recording seconds of the song.
    public let minute: Int?
    /// ID3FrameRecordingHourMinute description, useful for debug.
    public var debugDescription: String {
        return "\(hour ?? 0) \(minute ?? 0)"
    }
    
    /**
     Init a recording time.
     
     - parameter hour: the recording hour of the song.
     - parameter minute: the recording minute of the song.
     */
    public init(hour: Int?, minute: Int?) {
        self.hour = hour
        self.minute = minute
    }
}
