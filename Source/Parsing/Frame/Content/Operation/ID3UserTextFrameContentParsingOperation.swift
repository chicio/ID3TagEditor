import Foundation

struct ID3UserTextFrameContentParsingOperation: FrameContentParsingOperation, FrameParser {

  let frameName: FrameName

  func parse(frame: Data, version: ID3Version, completed: (FrameName, ID3Frame) -> ()) {
    var parsing = frame[...]
    extractHeader(from: &parsing, version: version)

    let encoding = extractEncoding(from: &parsing)

    let parsed = extractDescriptionAndValue(from: &parsing, encoding: encoding)
    let constructed = ID3FrameUserDefinedText(
      description: parsed.description,
      content: parsed.value
    )
    completed(frameName, constructed)
  }
}
