//
//  ID3LanguageFrameContentParsingOperationFactory.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/7/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

class ID3LanguageFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (content: ISO_639_2_Codes) in
            return (.Language, ID3FrameLanguage(language: content))
        }
    }
}
