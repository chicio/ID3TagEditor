//
//  ID3FrameStringContentParsingOperation.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameStringContentParsingOperation: FrameContentParsingOperation {
    private var stringContentParser: ID3FrameStringContentParser
    private var assignToTagOperation: (ID3Tag, String) -> ()

    init(stringContentParser: ID3FrameStringContentParser,
         assignToTagOperation: @escaping (ID3Tag, String) -> ()) {
        self.stringContentParser = stringContentParser
        self.assignToTagOperation = assignToTagOperation
    }

    func parse(frame: Data, id3Tag: ID3Tag) {
        if let frameContent = stringContentParser.parse(frame: frame, version: id3Tag.properties.version) {
            assignToTagOperation(id3Tag, frameContent)
        }
    }
}
