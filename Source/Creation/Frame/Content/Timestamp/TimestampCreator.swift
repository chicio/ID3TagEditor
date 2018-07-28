//
//  TimestampCreator.swift
//
//  Created by Fabrizio Duroni on 28/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol TimestampCreator {
    func createFrom(recordingDateTime: RecordingDateTime) -> String?
}
