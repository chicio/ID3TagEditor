//
//  ID3FrameStringContentParsingOperationFactory.swift
//
//  Created by Fabrizio Duroni on 27/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameStringContentParsingOperationFactory {
    static func make(operation: @escaping CreateFrameOperation) -> ID3FrameStringContentParsingOperation {
        let stringContentParser = ID3FrameStringContentParserFactory.make()
        return ID3FrameStringContentParsingOperation(stringContentParser: stringContentParser,
                                                     assignToTagOperation: operation)
    }
}
