
extension Collection {
    func pairs() -> [(Element, Element?)] {
        guard !isEmpty else { return [] }
        return (0..<count/2+count%2).map {
            let i1 = index(startIndex, offsetBy: $0*2)
            let i2 = index(after: i1)
            return (self[i1], i2 < endIndex ? self[i2] : nil)
        }
    }
}
