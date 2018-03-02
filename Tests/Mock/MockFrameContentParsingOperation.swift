//
//  MockFrameContentSizeCalculator.swift
//
//  Created by Fabrizio Duroni on 27/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockFrameContentParsingOperation: FrameStringContentParsingOperation {
    private var returnValue: String

    init(returnValue: String) {
        self.returnValue = returnValue
    }

    func parse(frame: Data, id3Tag: ID3Tag, finish: (String) -> ()) {
        finish(returnValue)
    }
}
