//
//  ID3FrameStringContentParsingOperationFactory.swift
//
//  Created by Nolaine Crusher on 03/30/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameURLStringContentParsingOperationFactory {
    static func make(operation: @escaping createFrameOperation) -> ID3FrameURLStringContentParsingOperation {
        let stringContentParser = ID3FrameURLStringContentParserFactory.make()
        return ID3FrameURLStringContentParsingOperation(urlStringContentParser: stringContentParser,
                                                     assignToTagOperation: operation)
    }
}
