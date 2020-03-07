//
//  ID3LanguageFrameContentParsingOperationFactory.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/7/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

class ID3LanguageFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (content: String) in
            #warning("I don't know what to do for an adaptor here, if anything")
            return (.Language, ID3FrameLanguage(language: content))
        }
    }
}
