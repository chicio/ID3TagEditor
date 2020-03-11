//
//  MockCommentTypeStringAdapter.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/11/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class MockCommentTypesStringAdapter: CommentTypesStringAdapter {
    func adapt(content: String) -> ID3FrameCommentTypes {
        return ID3FrameCommentTypes(language: "eng", contentDescription: "description", contentText: "content")
    }
}
