import Foundation

extension Data.SubSequence {

  /// Removes and returns the first *k* bytes from the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance).
  internal mutating func extractFirst(_ k: Int) -> Data.SubSequence {
    let extraction = self.prefix(k)
    self = self.dropFirst(k)
    return extraction
  }

  /// Removes and returns a null‐terminated string from the beginning of the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance).
  ///
  /// If there is no null‐termination, the string will be constructed from the entire subsequence.
  internal mutating func extractPrefixAsStringUntilNullTermination(_ encoding: ID3StringEncoding) -> String {
    return ""
  }
}
