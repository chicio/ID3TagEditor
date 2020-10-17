//
//  RecordingDateTime.swift
//
//  Created by Fabrizio Duroni on 26/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A struct used to represent the recording date for the ID3 recording date time frame.
 */
public struct RecordingDate: CustomDebugStringConvertible {
    /// Recording day of the song.
    public var day: Int?
    /// Recording month of the song.
    public var month: Int?
    /// Recording year of the song.
    public var year: Int?
    /// RecordingDate description, useful for debug.
    public var debugDescription: String {
        return "\(day ?? 0) \(month ?? 0) \(year ?? 0)"
    }

    /**
     Init a recording date.
     
     - parameter day: the recording day of the song.
     - parameter month: the recording month of the song.
     - parameter year: the recording year of the song.
     */
    public init(day: Int?, month: Int?, year: Int?) {
        self.day = day
        self.month = month
        self.year = year
    }
}

/**
 A struct used to represent the recording time for the ID3 recording date time frame.
 */
public struct RecordingTime: CustomDebugStringConvertible {
    /// Recording hour of the song.
    public var hour: Int?
    /// Recording seconds of the song.
    public var minute: Int?
    /// RecordingTime description, useful for debug.
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

/**
 A struct used to represent the recording date and time for the ID3 recording date time frame.
 */
public struct RecordingDateTime: CustomDebugStringConvertible {
    /// Recording date of the song.
    public var date: RecordingDate?
    /// Recording time of the song.
    public var time: RecordingTime?
    /// RecordingDateTime description, useful for debug.
    public var debugDescription: String {
        return "Date: (\(date?.debugDescription ?? "-") - Time: (\(time?.debugDescription ?? "-"))"
    }

    /**
     Init a recording date time.
     
     - parameter date: the recording date of the song.
     - parameter time: the recording time of the song.
     */
    public init(date: RecordingDate?, time: RecordingTime?) {
        self.date = date
        self.time = time
    }
}

/**
 A class used to represent an ID3 recording date time frame to be used in the ID3 tag.
 Valid only for ID3 tag version 2.4.
 */
public class ID3FrameRecordingDateTime: ID3Frame {
    /// The recordin date time information. This field contains date and time of the recording.
    public let recordingDateTime: RecordingDateTime

    /**
     Init an ID3 recording date time frame.
     
     - parameter recordingDateTime: a RecordingDateTime struct.
     */
    public init(recordingDateTime: RecordingDateTime) {
        self.recordingDateTime = recordingDateTime
    }
}
