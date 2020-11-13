//
//  ID3GenreFrameContentParsingOperationFactory.swift
//
//  Created by Fabrizio Duroni on 27/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3GenreFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make { (content: String) in
            return (.genre, ID3GenreStringAdapter().adapt(genre: content))
        }
    }
}
