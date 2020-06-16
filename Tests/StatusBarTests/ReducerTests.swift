import XCTest
@testable import StatusBar
import ComposableArchitecture

final class ReducerTests: XCTestCase {

    func testRefresh() {
        let store = TestStore(
            initialState: State(),
            reducer: reducer,
            environment: Environemnt(
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
                appTerminator: { _ in didTerminateApp = true }
            )
        )

        store.assert(
            .send(.quit),
            .do { XCTAssert(didTerminateApp) }
        )
    }

}
