//
//  ID3iTunesMovementCountFrameContentParsingOperationFactory.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/2/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

class ID3iTunesMovementCountFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (content: String) in
            return (.ITunesMovementCount, ID3FrameWithIntegerContent(value: Int(content)))
        }
    }
}
