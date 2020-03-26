//
//  ID3CommentFrameContentParsingOperation.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/7/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

struct ID3CommentFrameContentParsingOperation: FrameContentParsingOperation, FrameParser {

  let frameName: FrameName

  func parse(frame: Data, version: ID3Version, completed: (FrameName, ID3Frame) -> ()) {
    var parsing = frame[...]
    extractHeader(from: &parsing, version: version)

    let encoding = extractEncoding(from: &parsing)

    let languageCode = String(ascii: parsing.extractFirst(3))
    let language = ISO_639_2_Codes(rawValue: languageCode) ?? .und

    let parsed = extractDescriptionAndValue(from: &parsing, encoding: encoding)
    let constructed = ID3FrameCommentTypes(
      language: language,
      description: parsed.description,
      content: parsed.value
    )
    completed(frameName, constructed)
  }
}
