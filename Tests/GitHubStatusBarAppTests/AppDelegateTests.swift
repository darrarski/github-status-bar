import XCTest
@testable import GitHubStatusBarApp

final class AppDelegateTests: XCTestCase {

    func testAppRun() {
        let sut = AppDelegate()
        let notification = Notification(name: .init("test"))

        sut.applicationDidFinishLaunching(notification)

        XCTAssert(true)
    }

}
