@testable import ID3TagEditor

extension BidirectionalCollection where Element: Equatable {
  
  func describeDifference(
    from other: Self,
    describeElement: (Element) -> String
  ) -> String {
    var removals: Set<Int> = []
    var inserts: [Int: Element] = [:]

    if #available(macOS 10.15, *) {
      let differences = difference(from: other)
      for difference in differences {
        switch difference {
        case .remove(let offset, _, _):
          removals.insert(offset)
        case .insert(let offset, let element, _):
          inserts[offset] = element
        }
      }
    } else {
      removals = Set(0 ..< count)
      let offsetElementPairs = other.enumerated().lazy.map({ ($0.offset, $0.element) })
      inserts = Dictionary(uniqueKeysWithValues: offsetElementPairs)
    }

    var reportArray: [String] = []
    var resultOffset = 0
    var originalOffset = 0
    var continuingKeptRange = false
    while resultOffset != count {
      defer {
        resultOffset += 1
        originalOffset += 1
      }

      if removals.contains(originalOffset) {
        reportArray.append(
          "− " + describeElement(other[other.index(other.startIndex, offsetBy: originalOffset)])
        )
        resultOffset -= 1
        continuingKeptRange = false
      } else if let insert = inserts[resultOffset] {
        reportArray.append("+ " + describeElement(insert))
        originalOffset -= 1
        continuingKeptRange = false
      } else {
        if !continuingKeptRange {
          reportArray.append("  [...]")
        }
        continuingKeptRange = true
      }
    }
    return reportArray.joined(separator: "\n")
  }
}

extension BidirectionalCollection where Element: BinaryInteger {

  func describeDifference(
    from other: Self
  ) -> String {
    return describeDifference(from: other, describeElement: { [$0].hexadecimal() })
  }
}
