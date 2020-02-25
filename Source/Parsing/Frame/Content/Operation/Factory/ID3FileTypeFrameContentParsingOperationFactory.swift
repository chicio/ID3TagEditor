//
//  ID3FileTypeFrameContentParsingOperationFactory.swift
//
//  Created by Fabrizio Duroni on 27/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FileTypeFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (content: String) in
            return (.FileType, ID3FrameWithStringContent(content: content))
        }
    }
}
