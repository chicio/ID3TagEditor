import Foundation

struct ID3UserTextFrameContentParsingOperation: FrameContentParsingOperation, FrameParser {

  let frameName: FrameName

  func parse(frame: Data, version: ID3Version, completed: (FrameName, ID3Frame) -> ()) {
    var parsing = frame[...]
    extractHeader(from: &parsing, version: version)

    #warning("Should be able to throw or otherwise signal that the encoding flag was invalid. Falling back to the most standard encoding could cause trouble down the line.")
    let encoding = parsing.extractFirst(1).first.flatMap({ ID3StringEncoding(rawValue: $0) })
      ?? .utf8

    let languageCode = String(ascii: parsing.extractFirst(3))
    let language = ISO_639_2_Codes(rawValue: languageCode) ?? .und

    let description = parsing.extractPrefixAsStringUntilNullTermination(encoding)
    #warning("Upon encoding failure, this falls back to an empty string, losing information. It ought to throw or something instead.")
    let content = parsing.extractPrefixAsStringUntilNullTermination(encoding) ?? ""
    let constructed = ID3FrameCommentTypes(
      language: language,
      description: description,
      content: content
    )
    completed(frameName, constructed)
  }
}
