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
        #expect(ID3FrameConfiguration().frameTypeFor(identifierNumeric: 0x1A2B3C4D, version: .version2) == .invalid)
    }
}
