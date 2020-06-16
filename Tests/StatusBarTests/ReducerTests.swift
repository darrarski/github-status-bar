import XCTest
@testable import StatusBar
@testable import GitHub
import ComposableArchitecture

final class ReducerTests: XCTestCase {

    func testOpenNotification() {
        var didOpenURLs = [URL]()

        let store = TestStore(
            initialState: State(notifications: [
                .fixture(id: "1")
            ]),
            reducer: reducer,
            environment: Environemnt(
                urlOpener: { didOpenURLs.append($0) },
                appTerminator: { _ in fatalError() }
            )
        )

        store.assert(
            .send(.openNotification(id: "1")),
            .do {
                XCTAssertEqual(didOpenURLs, [Notification.fixture(id: "1").webURL!])
            }
        )
    }

    func testRefresh() {
        let store = TestStore(
            initialState: State(),
            reducer: reducer,
            environment: Environemnt(
                urlOpener: { _ in fatalError() },
                appTerminator: { _ in fatalError() }
            )
        )

        store.assert(
            .send(.refresh)
        )
    }

    func testQuit() {
        var didTerminateApp = false

        let store = TestStore(
            initialState: State(),
            reducer: reducer,
            environment: Environemnt(
                urlOpener: { _ in fatalError() },
                appTerminator: { _ in didTerminateApp = true }
            )
        )

        store.assert(
            .send(.quit),
            .do { XCTAssert(didTerminateApp) }
        )
    }

}
