import XCTest
@testable import zombie_dice

final class zombie_diceTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(zombie_dice().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
