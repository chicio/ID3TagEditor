import Foundation

internal protocol FrameParser {
  var frameName: FrameName { get }
}

extension FrameParser {

  func extractHeader(from frameData: inout Data.SubSequence, version: ID3Version) {
    let name = frameData.extractFirst(version.identifierSize)
    assert(
      String(ascii: name) == frameName.fourByteString
        || String(ascii: name) == frameName.threeByteString,
      "Mismatched frame name: \(String(ascii: name)) ≠ \(frameName.fourByteString!)/\(frameName.threeByteString!)"
    )
    _ = frameData.extractFirst(version.sizeSize)
    _ = frameData.extractFirst(version.flagSize)
  }
}
