//
//  ID3CommentTypesStringAdapterTest.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/11/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import XCTest
@testable import ID3TagEditor

class ID3CommentTypesStringAdapterTest: XCTestCase {
    let commentTypeStringAdapter = ID3CommentTypesStringAdapter()

    func testAdaptCommentWithLanguage() {
        let commentWithLanguage = commentTypeStringAdapter.adapt(content: "eng:description:content")

        XCTAssertEqual(commentWithLanguage.language,"eng")
        XCTAssertEqual(commentWithLanguage.contentDescription,"description")
        XCTAssertEqual(commentWithLanguage.contentText,"content")
    }

    func testAdaptCommentWithoutDescription() {
        let commentNoDescription = commentTypeStringAdapter.adapt(content: "eng::content")

        XCTAssertEqual(commentNoDescription.contentDescription,"")
        XCTAssertEqual(commentNoDescription.language, "eng")
        XCTAssertEqual(commentNoDescription.contentText, "content")
    }

    func testAdaptCommentWithoutLanguage() {
        let commentNoLanguage = commentTypeStringAdapter.adapt(content: ":description:content")

        XCTAssertEqual(commentNoLanguage.contentDescription,"description")
        XCTAssertEqual(commentNoLanguage.language, "zxx")
        XCTAssertEqual(commentNoLanguage.contentText, "content")
    }

    func testAdaptCommentWithoutContentText() {
        let commentNoComment = commentTypeStringAdapter.adapt(content: "eng:description:")

        XCTAssertEqual(commentNoComment.contentDescription,"description")
        XCTAssertEqual(commentNoComment.language, "eng")
        XCTAssertEqual(commentNoComment.contentText, "")
    }
}
