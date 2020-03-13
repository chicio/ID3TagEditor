//
//  ID3CommentTypesFrameAdapterTest.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/13/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//


import XCTest
@testable import ID3TagEditor

class ID3CommentTypesStringAdapterTest: XCTestCase {
    let commentTypesStringAdapter = ID3CommentTypesStringAdapter()

    func testAdaptCommentWithDescription() {
        let comment = commentTypesStringAdapter.adapt(content: "zxx:description:contentText")
        XCTAssertEqual(comment.language, ISO_639_2_Codes.zxx)
        XCTAssertEqual(comment.contentDescription, "description")
        XCTAssertEqual(comment.contentText, "contentText")

    }

    func testAdaptCommentWithoutDescription() {
        let comment = commentTypesStringAdapter.adapt(content: "zxx::contentText")
        XCTAssertEqual(comment.language, ISO_639_2_Codes.zxx)
        XCTAssertEqual(comment.contentDescription, "")
        XCTAssertEqual(comment.contentText, "contentText")
    }

    func testAdaptNotACountryCode() {
        let comment = commentTypesStringAdapter.adapt(content: "noCountry:description:contentText")
        #warning("I'm not sure about this one. I'm not sure I did it right so that it defaults to zxx (no language) in the case of an invalid language")
        XCTAssertEqual(comment.language, ISO_639_2_Codes.zxx)
        XCTAssertEqual(comment.contentDescription, "description")
        XCTAssertEqual(comment.contentText, "contentText")

    }
}
