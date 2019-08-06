//
//  ID3 PopularimeterFrameContentParsingOperationFactory.swift
//  mplayer
//
//  Created by Alex Lebedev on 11 Jul 19.
//

import Foundation

class ID3PopularimeterFrameContentParsingOperationFactory {
    static func make() -> ID3PopularimeterFrameContentParsingOperation {
        let stringContentParser = ID3FrameStringContentParserFactory.make()
        return ID3PopularimeterFrameContentParsingOperation(stringContentParser: stringContentParser,
                                                            id3FrameConfiguration: ID3FrameConfiguration())
    }
}
