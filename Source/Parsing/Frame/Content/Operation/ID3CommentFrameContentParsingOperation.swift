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
    var parsing = frame[...]
    let name = parsing.extractFirst(3)
    assert(
      String(ascii: name) == "ULT",
      "Mismatched frame name: \(String(ascii: name)) ≠ ULT"
    )
    _ = parsing.extractFirst(3) // Size

    #warning("Should be able to throw or otherwise signal that the encoding flag was invalid. Falling back to the most standard encoding could cause trouble down the line.")
    let encoding = parsing.extractFirst(1).first.flatMap({ ID3StringEncoding(rawValue: $0) })
      ?? ID3StringEncoding.UTF8

    let language = ISO_639_2_Codes(rawValue: String(ascii: parsing.extractFirst(3))) ?? .und

    let description = parsing.extractPrefixAsStringUntilNullTermination(encoding)
    let content = parsing.extractPrefixAsStringUntilNullTermination(encoding)
    let constructed = ID3FrameCommentTypes(language: language, description: description, content: content)
    completed(frameName, constructed)
  }
}
