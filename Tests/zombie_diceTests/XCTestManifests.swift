import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(zombie_diceTests.allTests),
    ]
}
#endif
