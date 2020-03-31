//
//  ID3RadioStationUrlFrameContentParsingOperationFactory.swift
//
//
//  Created by Nolaine Crusher on 3/30/20.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3RadioStationUrlFrameContentParsingOperationFactory {
    static func make() -> ID3FrameURLStringContentParsingOperation {
        return ID3FrameURLStringContentParsingOperationFactory.make() { (content: String) in
            return (.RadioStationUrl, ID3FrameWithStringContent(content: content))
        }
    }
}
