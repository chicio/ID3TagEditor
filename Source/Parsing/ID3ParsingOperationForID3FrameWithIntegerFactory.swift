//
//  ParsingOperationForID3FrameWithIntegerContentFactory.swift
//
//  Created by Fabrizio Duroni on 12.01.20.
//  2020 Fabrizio Duroni.
//

import Foundation

class ID3ParsingOperationForID3FrameWithIntegerFactory {
    static func make(frameName: FrameName) -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make { (content: String) in
            return (frameName, ID3FrameWithIntegerContent(value: Int(content)))
        }
    }
}
