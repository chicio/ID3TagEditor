//
//  ID3FrameStringContentParsingOperation.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

typealias AssignToTagOperation = (ID3Tag, String) -> ()

class ID3FrameStringContentParsingOperation: FrameContentParsingOperation {
    private var stringContentParser: ID3FrameStringContentParser
    private var assignToTagOperation: AssignToTagOperation

    init(stringContentParser: ID3FrameStringContentParser,
         assignToTagOperation: @escaping AssignToTagOperation) {
        self.stringContentParser = stringContentParser
        self.assignToTagOperation = assignToTagOperation
    }

    func parse(frame: Data, id3Tag: ID3Tag) {
        if let frameContent = stringContentParser.parse(frame: frame, version: id3Tag.properties.version) {
            assignToTagOperation(id3Tag, frameContent)
        }
    }
}
