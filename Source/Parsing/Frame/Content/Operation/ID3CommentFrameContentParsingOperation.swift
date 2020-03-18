//
//  ID3CommentFrameContentParsingOperation.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/7/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

struct ID3CommentFrameContentParsingOperation: FrameContentParsingOperation {

  let frameName: FrameName

  func parse(frame: Data, version: ID3Version, completed: (FrameName, ID3Frame) -> ()) {
    #warning("Needs to actually parse real values.")
    completed(frameName, ID3FrameCommentTypes(language: .und, description: nil, content: ""))
  }
}
