//
//  ID3FrameURLStringContentParsingOperation.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

typealias createFrameOperation = (String) -> ((FrameName, ID3Frame))

class ID3FrameURLStringContentParsingOperation: FrameContentParsingOperation {
    private var urlStringContentParser: ID3FrameURLStringContentParser
    private var createFrameOperation: createFrameOperation

    init(urlStringContentParser: ID3FrameURLStringContentParser,
         assignToTagOperation: @escaping createFrameOperation) {
        self.urlStringContentParser = urlStringContentParser
        self.createFrameOperation = assignToTagOperation
    }

    func parse(frame: Data, version: ID3Version, completed: (FrameName, ID3Frame) -> ()) {
        if let frameContent = urlStringContentParser.parse(frame: frame, version: version) {
            let frameNameAndFrame = createFrameOperation(frameContent)
            completed(frameNameAndFrame.0, frameNameAndFrame.1)
        }
    }
}
