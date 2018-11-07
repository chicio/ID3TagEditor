import XCTest

import DesktopTests

var tests = [XCTestCaseEntry]()
tests += DesktopTests.allTests()
XCTMain(tests)