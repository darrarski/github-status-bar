import XCTest
@testable import GitHubStatusBarApp

final class AppDelegateTests: XCTestCase {

    func testAppRun() {
        let sut = AppDelegate()
        var output = ""
        sut.textOutput = .init { output.append($0) }
        let notification = Notification(name: .init("test"))

        sut.applicationDidFinishLaunching(notification)

        XCTAssertEqual(output, "Hello, World!\n")
    }

}
