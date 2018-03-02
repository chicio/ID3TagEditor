//
//  MockPaddingRemover.swift
//
//  Created by Fabrizio Duroni on 02/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockPaddingRemover: PaddingRemover {
    private let returnValue: String

    init(returnValue: String) {
        self.returnValue = returnValue
    }

    func removeFrom(string: String) -> String {
        return returnValue
    }
}
