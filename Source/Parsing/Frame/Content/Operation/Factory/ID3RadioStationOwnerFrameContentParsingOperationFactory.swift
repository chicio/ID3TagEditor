//
//  ID3RadioStationOwnerFrameContentParsingOperationFactory.swift
//
//  Created by Nolaine Crusher on 3/30/20.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3RadioStationOwnerFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (content: String) in
            return (.RadioStationOwner, ID3FrameWithStringContent(content: content))
        }
    }
}
