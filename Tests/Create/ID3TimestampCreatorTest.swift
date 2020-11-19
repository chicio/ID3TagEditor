//
//  ID3TimestampCreatorTest.swift
//
//  Created by Fabrizio Duroni on 28/07/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3TimestampCreatorTest: XCTestCase {
    func testCreateTimestampCorrectly() {
        let recordingTime = RecordingDateTime(date: RecordingDate(day: 28, month: 7, year: 2018),
                                              time: RecordingTime(hour: 12, minute: 35))
        let timestampCreator = ID3TimestampCreator()

        XCTAssertEqual(timestampCreator.createFrom(recordingDateTime: recordingTime), "1532781300")
    }

    func testNilDay() {
        let recordingTime = RecordingDateTime(date: RecordingDate(day: nil, month: 7, year: 2018),
                                              time: RecordingTime(hour: 12, minute: 35))
        let timestampCreator = ID3TimestampCreator()

        XCTAssertEqual(timestampCreator.createFrom(recordingDateTime: recordingTime), nil)
    }

    func testNilMonth() {
        let recordingTime = RecordingDateTime(date: RecordingDate(day: 28, month: nil, year: 2018),
                                              time: RecordingTime(hour: 12, minute: 35))
        let timestampCreator = ID3TimestampCreator()

        XCTAssertEqual(timestampCreator.createFrom(recordingDateTime: recordingTime), nil)
    }

    func testNilYear() {
        let recordingTime = RecordingDateTime(date: RecordingDate(day: 28, month: 7, year: nil),
                                              time: RecordingTime(hour: 12, minute: 35))
        let timestampCreator = ID3TimestampCreator()

        XCTAssertEqual(timestampCreator.createFrom(recordingDateTime: recordingTime), nil)
    }

    func testNilHour() {
        let recordingTime = RecordingDateTime(date: RecordingDate(day: 28, month: 7, year: 2018),
                                              time: RecordingTime(hour: nil, minute: 35))
        let timestampCreator = ID3TimestampCreator()

        XCTAssertEqual(timestampCreator.createFrom(recordingDateTime: recordingTime), nil)
    }

    func testNilMinute() {
        let recordingTime = RecordingDateTime(date: RecordingDate(day: 28, month: 7, year: 2018),
                                              time: RecordingTime(hour: 12, minute: nil))
        let timestampCreator = ID3TimestampCreator()

        XCTAssertEqual(timestampCreator.createFrom(recordingDateTime: recordingTime), nil)
    }

    static var allTests = [
        ("testCreateTimestampCorrectly", testCreateTimestampCorrectly),
        ("testNilDay", testNilDay),
        ("testNilMonth", testNilMonth),
        ("testNilYear", testNilYear),
        ("testNilHour", testNilHour),
        ("testNilMinute", testNilMinute)
    ]
}
