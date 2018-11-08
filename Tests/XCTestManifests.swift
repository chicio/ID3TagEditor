import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ID3TimestampCreatorTest.allTests),
    ]
}
#endif
