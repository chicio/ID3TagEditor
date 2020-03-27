extension String {

  internal init<S>(ascii: S) where S: Sequence, S.Element == UInt8 {
    assert(!ascii.contains(where: { $0 > 0x7F }), "Bytes are not ASCII: \(ascii.hexadecimal())")
    let scalars = String.UnicodeScalarView(ascii.lazy.map({ Unicode.Scalar($0) }))
    self = String(scalars)
  }
}
