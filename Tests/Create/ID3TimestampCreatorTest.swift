//
//  ID3TimestampCreatorTest.swift
//
//  Created by Fabrizio Duroni on 28/07/2018.
//  2018 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct ID3TimestampCreatorTest {
    @Test func testCreateTimestampCorrectly() {
        let recordingTime = RecordingDateTime(date: RecordingDate(day: 28, month: 7, year: 2018),
                                              time: RecordingTime(hour: 12, minute: 35))
        let timestampCreator = ID3TimestampCreator()

        #expect(timestampCreator.createFrom(recordingDateTime: recordingTime) == "1532781300")
    }

    @Test func testNilDay() {
        let recordingTime = RecordingDateTime(date: RecordingDate(day: nil, month: 7, year: 2018),
                                              time: RecordingTime(hour: 12, minute: 35))
        let timestampCreator = ID3TimestampCreator()

        #expect(timestampCreator.createFrom(recordingDateTime: recordingTime) == nil)
    }

    @Test func testNilMonth() {
        let recordingTime = RecordingDateTime(date: RecordingDate(day: 28, month: nil, year: 2018),
                                              time: RecordingTime(hour: 12, minute: 35))
        let timestampCreator = ID3TimestampCreator()

        #expect(timestampCreator.createFrom(recordingDateTime: recordingTime) == nil)
    }

    @Test func testNilYear() {
        let recordingTime = RecordingDateTime(date: RecordingDate(day: 28, month: 7, year: nil),
                                              time: RecordingTime(hour: 12, minute: 35))
        let timestampCreator = ID3TimestampCreator()

        #expect(timestampCreator.createFrom(recordingDateTime: recordingTime) == nil)
    }

    @Test func testNilHour() {
        let recordingTime = RecordingDateTime(date: RecordingDate(day: 28, month: 7, year: 2018),
                                              time: RecordingTime(hour: nil, minute: 35))
        let timestampCreator = ID3TimestampCreator()

        #expect(timestampCreator.createFrom(recordingDateTime: recordingTime) == nil)
    }

    @Test func testNilMinute() {
        let recordingTime = RecordingDateTime(date: RecordingDate(day: 28, month: 7, year: 2018),
                                              time: RecordingTime(hour: 12, minute: nil))
        let timestampCreator = ID3TimestampCreator()

        #expect(timestampCreator.createFrom(recordingDateTime: recordingTime) == nil)
    }
}
