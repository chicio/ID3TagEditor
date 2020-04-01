//
//  ID3ITunesCompilationFlagFrameContentParsingOperationFactory.swift
//
//
//  Created by Nolaine Crusher on 3/31/20.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3ITunesCompilationFlagFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (content: String) in
            return (.ITunesCompilation, ID3FrameWithBooleanContent(value: Bool(content)))
        }
    }
}

