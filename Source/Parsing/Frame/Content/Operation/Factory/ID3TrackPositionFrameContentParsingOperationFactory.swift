//
//  ID3TrackPositionContentParsingOperationFactory.swift
//
//  Created by Fabrizio Duroni on 27/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TrackPositionFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make { (content: String) in
            return (.trackPosition, ID3PartOfTotalStringAdapter().adapt(partOfTotal: content))
        }
    }
}
