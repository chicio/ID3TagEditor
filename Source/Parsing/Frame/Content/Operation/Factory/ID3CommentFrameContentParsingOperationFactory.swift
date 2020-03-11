//
//  ID3CommentFrameContentParsingOperationFactory.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/7/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

class ID3CommentFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (content: String) in
            return (.Comment, ID3CommentTypesStringAdapter().adapt(content: content))
        }
    }
}
