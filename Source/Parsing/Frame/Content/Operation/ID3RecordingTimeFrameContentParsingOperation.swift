//
//  ID3RecordingTimeFrameContentParsingOperation.swift
//
//  Created by Fabrizio Duroni on 27/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3RecordingTimeFrameContentParsingOperation: FrameContentParsingOperation {
    private let stringEncodingDetector: ID3FrameStringEncodingDetector
    private let paddingRemover: PaddingRemover
    private let id3FrameConfiguration: ID3FrameConfiguration
    
    init(stringEncodingDetector: ID3FrameStringEncodingDetector,
         paddingRemover: PaddingRemover,
         id3FrameConfiguration: ID3FrameConfiguration) {
        self.stringEncodingDetector = stringEncodingDetector
        self.paddingRemover = paddingRemover
        self.id3FrameConfiguration = id3FrameConfiguration
    }
    
    func parse(frame: Data, id3Tag: ID3Tag) {
        let headerSize = id3FrameConfiguration.headerSizeFor(version: id3Tag.properties.version)
        let frameContentRangeStart = headerSize + id3FrameConfiguration.encodingSize()
        let frameContentRange = Range(frameContentRangeStart..<frame.count)
        let frameContent = frame.subdata(in: frameContentRange)
        let encoding = stringEncodingDetector.detect(frame: frame, version: id3Tag.properties.version)
        if let frameContent = String(data: frameContent, encoding: encoding) {
            
            if let frameContentAsDouble = Double(frameContent), frameContentAsDouble > 9999 {
                let date = Date(timeIntervalSince1970: frameContentAsDouble)
                var calendar = Calendar(identifier: .gregorian)
                calendar.timeZone = TimeZone(identifier: "UTC")!
                id3Tag.recordingDateTime?.date?.day = String(calendar.component(.day, from: date))
                id3Tag.recordingDateTime?.date?.month = String(calendar.component(.month, from: date))
                id3Tag.recordingDateTime?.date?.year = String(calendar.component(.year, from: date))
                id3Tag.recordingDateTime?.time?.hour = String(calendar.component(.hour, from: date))
                id3Tag.recordingDateTime?.time?.minute = String(calendar.component(.minute, from: date))
                id3Tag.recordingDateTime?.time?.second = String(calendar.component(.second, from: date))
            } else {
                /**
                 Fallback case:
                 A lot mp3 that have a id3 tag version 2.4 use the recording time frame ("TRDC") in a wrong way.
                 Instead of a valid timestamp they have a 4 digit number that is equivalent to the year that was
                 previously stored inside the year of recoding frame ("TYE" v2.2 and "TYER" v2.3). So as a fallback and
                 to keep general compatibility with the mp3 taggers available we check that the content of the
                 frame is a number major than 9999: if not this is a YEAR saved inside a field with a timestamp :).
                 */
                id3Tag.recordingDateTime?.date?.year = frameContent
            }
        }
    }
}
