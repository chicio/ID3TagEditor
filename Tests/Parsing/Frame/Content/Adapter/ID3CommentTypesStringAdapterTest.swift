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
        let comment = commentTypesStringAdapter.adapt(content: "und:description:contentText")
        XCTAssertEqual(comment.language, ISO_639_2_Codes.und)
        XCTAssertEqual(comment.description, "description")
        XCTAssertEqual(comment.content, "contentText")

    }

    func testAdaptCommentWithoutDescription() {
        let comment = commentTypesStringAdapter.adapt(content: "und::contentText")
        XCTAssertEqual(comment.language, ISO_639_2_Codes.und)
        XCTAssertEqual(comment.description, "")
        XCTAssertEqual(comment.content, "contentText")
    }

    func testAdaptNotACountryCode() {
        let comment = commentTypesStringAdapter.adapt(content: "noCountry:description:contentText")
        #warning("I'm not sure about this one. I'm not sure I did it right so that it defaults to und (undefined) in the case of an invalid language")
        XCTAssertEqual(comment.language, ISO_639_2_Codes.und)
        XCTAssertEqual(comment.description, "description")
        XCTAssertEqual(comment.content, "contentText")

    }
}
