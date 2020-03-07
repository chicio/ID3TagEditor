//
//  ID3CommentFrameContentParsingOperationFactory.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/7/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

class ID3CommentFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (language: String?, contentDescription: String, contentText: String) in
            #warning("I don't know what to do for an adaptor here, if anything")
            return (.Comment, ID3FrameCommentLyrics(language: <#T##String?#>, contentDescription: <#T##String?#>, contentText: <#T##String#>))
        }
    }
}
