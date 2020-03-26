import Foundation

internal protocol FrameParser {
  var frameName: FrameName { get }
}

extension FrameParser {

  internal func extractHeader(from frameData: inout Data.SubSequence, version: ID3Version) {
    let name = frameData.extractFirst(version.identifierSize)
    assert(
      String(ascii: name) == frameName.fourByteString
        || String(ascii: name) == frameName.threeByteString,
      "Mismatched frame name: \(String(ascii: name)) ≠ \(frameName.fourByteString!)/\(frameName.threeByteString!)"
    )
    _ = frameData.extractFirst(version.sizeSize)
    _ = frameData.extractFirst(version.flagSize)
  }

  internal func extractEncoding(from frameData: inout Data.SubSequence) -> ID3StringEncoding {
    #warning("Should be able to throw or otherwise signal that the encoding flag was invalid. Falling back to the most standard encoding could cause trouble down the line.")
    return frameData.extractFirst(1).first.flatMap({ ID3StringEncoding(rawValue: $0) })
      ?? .utf8
  }
}
