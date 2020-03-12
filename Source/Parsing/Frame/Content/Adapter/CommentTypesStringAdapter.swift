//
//  CommentTypesStringAdapter.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/10/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

protocol CommentTypesStringAdapter {
    func adapt(content: String) -> ID3FrameCommentTypes
}
