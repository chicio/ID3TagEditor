//
//  RecordingDateTime.swift
//
//  Created by Fabrizio Duroni on 26/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A struct used to represent the recording date for the ID3 tag.
 */
public struct RecordingDate: CustomDebugStringConvertible {
    /// Recording day of the song.
    public var day: Int?
    /// Recording month of the song.
    public var month: Int?
    /// Recording year of the song.
    public var year: Int?
    
    public var debugDescription: String {
        return "\(day ?? 0) \(month ?? 0) \(year ?? 0)"
    }
    
    init() {
        self.day = nil
        self.month = nil
        self.year = nil
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
 A struct used to represent the recording time for the ID3 tag.
 */
public struct RecordingTime: CustomDebugStringConvertible {
    /// Recording hour of the song.
    public var hour: Int?
    /// Recording seconds of the song.
    public var minute: Int?
    
    public var debugDescription: String {
        return "\(hour ?? 0) \(minute ?? 0)"
    }
    
    init() {
        self.hour = nil
        self.minute = nil
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
 A struct used to represent the recording date and time for the ID3 tag.
 */
public struct RecordingDateTime: CustomDebugStringConvertible {
    /// Recording date of the song.
    public var date: RecordingDate?
    /// Recording time of the song.
    public var time: RecordingTime?
    
    public var debugDescription: String {
        return "Date: (\(date?.debugDescription ?? "-") - Time: (\(time?.debugDescription ?? "-"))"
    }
    
    init() {
        self.date = RecordingDate()
        self.time = RecordingTime()
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
