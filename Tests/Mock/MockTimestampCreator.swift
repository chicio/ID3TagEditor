//
//  MockTimestampCreator.swift
//
//  Created by Fabrizio Duroni on 28/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockTimestampCreator: TimestampCreator {
    var createFromRecordingDateTimeHasBeenCalled: Bool = false
    private let returnValue: String

    init(returnValue: String) {
        self.returnValue = returnValue
    }

    func createFrom(recordingDateTime: RecordingDateTime) -> String? {
        self.createFromRecordingDateTimeHasBeenCalled = true
        return self.returnValue
    }
}
