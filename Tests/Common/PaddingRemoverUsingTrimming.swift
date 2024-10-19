//
//  PaddingRemoverUsingTrimming.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct PaddingRemoverUsingTrimmingTest {
    @Test func testRemovePadding() {
        #expect(
                "simple string" ==
                PaddingRemoverUsingTrimming().removeFrom(string: "\0\0\0simple string\0\0\0")
        )
    }
}
