//
//  ID3iTunesCompilationFlagFrameContentParsingOperationFactory.swift
//
//
//  Created by Nolaine Crusher on 3/31/20.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3iTunesCompilationFlagFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (content: String) in
            return (.iTunesCompilation, ID3BooleanStringAdapter().adapt(boolString: content))
        }
    }
}
