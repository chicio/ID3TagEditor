//
//  ID3FrameBooleanContentParsingOperationFactory.swift
//
//  Created by Nolaine Crusher on 03/30/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameBooleanContentParsingOperationFactory {
    static func make(operation: @escaping createBooleanFrameOperation) -> ID3FrameBooleanContentParsingOperation {
        let booleanContentParser = ID3FrameBooleanContentParserFactory.make()
        return ID3FrameBooleanContentParsingOperation(
            booleanContentParser: booleanContentParser,
            assignToTagOperation: operation)
    }
}
