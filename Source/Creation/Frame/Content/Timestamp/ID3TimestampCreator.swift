//
//  ID3TimestampCreator.swift
//
//  Created by Fabrizio Duroni on 28/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TimestampCreator: TimestampCreator {
    func createFrom(recordingDateTime: RecordingDateTime) -> String? {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "UTC")!
        if let day = recordingDateTime.date?.day,
            let month = recordingDateTime.date?.month,
            let year = recordingDateTime.date?.year,
            let hour = recordingDateTime.time?.hour,
            let minute = recordingDateTime.time?.minute {
            let components = DateComponents(year: year,
                                            month: month,
                                            day: day,
                                            hour: hour,
                                            minute: minute,
                                            second: 0)
            let timestamp = String(format: "%.0f", calendar.date(from: components)!.timeIntervalSince1970)
            return timestamp
        }
        return nil
    }
}
