//
//  ID3CreditsListFrameContentParsingOperation.swift
//
//  Created by Nolaine Crusher on 4/02/20.
//  2018 Fabrizio Duroni.
//

import Foundation

struct ID3CreditsListFrameContentParsingOperation: FrameContentParsingOperation, FrameParser {
    
    let frameName: FrameName
    
    func parse(frame: Data, version: ID3Version, completed: (FrameName, ID3Frame) -> ()) {
        var parsing = frame[...]
        extractHeader(from: &parsing, version: version)
        
        let encoding = extractEncoding(from: &parsing)
        
        let parsed = extractCreditStrings(from: &parsing, encoding: encoding)
        var entries: [(role: String, person: String)] = []
        for pair in parsed {
            entries.append((role: pair.0, person: pair.1))
        }
        let constructed = ID3FrameCreditsList(
            entries: entries
        )
        completed(frameName, constructed)
    }
}
