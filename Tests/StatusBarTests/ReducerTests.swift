import XCTest
@testable import StatusBar
@testable import GitHub
import Combine
import ComposableArchitecture

final class ReducerTests: XCTestCase {

    func testTerminateApp() {
        var didTerminateApp = false

        let store = TestStore(
            initialState: State(),
            reducer: reducer,
            environment: Environemnt(
                appTerminator: { _ in didTerminateApp = true }
            )
        )

        store.assert(
            .send(.terminateApp),
            .do { XCTAssert(didTerminateApp) }
        )
    }

}
