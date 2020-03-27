extension Sequence where Element: BinaryInteger {

  internal func hexadecimal() -> String {
    return lazy.map({ String($0, radix: 16) }).joined(separator: " ")
  }
}
