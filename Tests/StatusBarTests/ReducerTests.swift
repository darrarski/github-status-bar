import XCTest
@testable import StatusBar
import ComposableArchitecture

final class ReducerTests: XCTestCase {

    func testSelectingRefresh() {
        let store = TestStore(
            initialState: State(),
            reducer: reducer,
            environment: Environemnt(
                appTerminator: { _ in fatalError() }
            )
        )

        store.assert(
            .send(.didSelectRefresh)
        )
    }

    func testSelectingQuit() {
        var didTerminateApp = false

        let store = TestStore(
            initialState: State(),
            reducer: reducer,
            environment: Environemnt(
                appTerminator: { _ in didTerminateApp = true }
            )
        )

        store.assert(
            .send(.didSelectQuit),
            .do { XCTAssert(didTerminateApp) }
        )
    }

}
