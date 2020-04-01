//
//  ID3SortTitleFrameContentParsingOperationFactory.swift
//
//  Created by Nolaine Crusher on 03/30/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3SortTitleFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (content: String) in
            return (.SortTitle, ID3FrameWithStringContent(content: content))
        }
    }
}
