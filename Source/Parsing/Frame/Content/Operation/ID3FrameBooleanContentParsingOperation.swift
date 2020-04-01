//
//  ID3FrameURLStringContentParsingOperation.swift
//
//  Created by Nolaine Crusher on 03/30/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

typealias createBooleanFrameOperation = (Bool) -> ((FrameName, ID3Frame))

class ID3FrameBooleanContentParsingOperation: FrameContentParsingOperation {
    private var booleanContentParser: ID3FrameBooleanContentParser
    private var createBooleanFrameOperation: createBooleanFrameOperation
    
    init(booleanContentParser: ID3FrameBooleanContentParser,
         assignToTagOperation: @escaping createBooleanFrameOperation) {
        self.booleanContentParser = booleanContentParser
        self.createBooleanFrameOperation = assignToTagOperation
    }
    
    func parse(frame: Data, version: ID3Version, completed: (FrameName, ID3Frame) -> ()) {
        if let frameContent = booleanContentParser.parse(
            frame: frame, version: version) {
            let frameNameAndFrame = createBooleanFrameOperation(frameContent)
            completed(frameNameAndFrame.0, frameNameAndFrame.1)
        }
    }
}
