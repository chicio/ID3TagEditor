//
//  ID3FrameStringContentParsingOperation.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

typealias CreateFrameOperation = (String) -> ((FrameName, ID3Frame))

class ID3FrameStringContentParsingOperation: FrameContentParsingOperation {
    private var stringContentParser: ID3FrameStringContentParser
    private var createFrameOperation: CreateFrameOperation

    init(stringContentParser: ID3FrameStringContentParser,
         assignToTagOperation: @escaping CreateFrameOperation) {
        self.stringContentParser = stringContentParser
        self.createFrameOperation = assignToTagOperation
    }

    func parse(frame: Data, version: ID3Version, completed: (FrameName, ID3Frame) -> Void) {
        if let frameContent = stringContentParser.parse(frame: frame, version: version) {
            let frameNameAndFrame = createFrameOperation(frameContent)
            completed(frameNameAndFrame.0, frameNameAndFrame.1)
        }
    }
}
