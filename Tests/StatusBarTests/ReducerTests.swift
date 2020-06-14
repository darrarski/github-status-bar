import XCTest
@testable import StatusBar
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
            .send(.didSelectQuit),
            .do { XCTAssert(didTerminateApp) }
        )
    }

}
