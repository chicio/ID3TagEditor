//
//  ID3FrameConfigurationTest.swift
//
//  Created by Fabrizio Duroni on 02/03/2018.
//  2018 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct ID3FrameConfigurationTest {
    @Test func invalidIdentifierName() {
        #expect(ID3FrameConfiguration().frameTypeFor(identifier: "::not-valid::", version: .version2) == .invalid)
    }
}
