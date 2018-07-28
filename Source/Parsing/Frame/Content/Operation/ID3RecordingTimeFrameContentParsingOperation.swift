//
//  ID3RecordingTimeFrameContentParsingOperation.swift
//
//  Created by Fabrizio Duroni on 27/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3RecordingTimeFrameContentParsingOperation: FrameContentParsingOperation {
    private let stringContentParser: ID3FrameStringContentParser
    
    init(stringContentParser: ID3FrameStringContentParser) {
        self.stringContentParser = stringContentParser
    }
    
    func parse(frame: Data, id3Tag: ID3Tag) {
        if let frameContent = stringContentParser.parse(frame: frame, version: id3Tag.properties.version) {
            parse(content: frameContent, id3Tag: id3Tag)
        }
    }

    private func parse(content: String, id3Tag: ID3Tag) {
        if let frameContentAsDouble = Double(content), frameContentAsDouble > 9999 {
            let date = Date(timeIntervalSince1970: frameContentAsDouble)
            var calendar = Calendar(identifier: .gregorian)
            calendar.timeZone = TimeZone(identifier: "UTC")!
            id3Tag.recordingDateTime?.date?.day = calendar.component(.day, from: date)
            id3Tag.recordingDateTime?.date?.month = calendar.component(.month, from: date)
            id3Tag.recordingDateTime?.date?.year = calendar.component(.year, from: date)
            id3Tag.recordingDateTime?.time?.hour = calendar.component(.hour, from: date)
            id3Tag.recordingDateTime?.time?.minute = calendar.component(.minute, from: date)
        } else {
            /**
             Fallback case:
             A lot mp3 that have a id3 tag version 2.4 use the recording time frame ("TRDC") in a wrong way.
             Instead of a valid timestamp they have a 4 digit number that is equivalent to the year that was
             previously stored inside the year of recoding frame ("TYE" v2.2 and "TYER" v2.3). So as a fallback and
             to keep general compatibility with the mp3 taggers available we check that the content of the
             frame is a number major than 9999: if not this is a YEAR saved inside a field with a timestamp :).
             */
            id3Tag.recordingDateTime?.date?.year = Int(content)
        }
    }
}
