import XCTest
@testable import StatusBar
@testable import GitHub
import ComposableArchitecture

final class ReducerTests: XCTestCase {

    func testOpenIssueNotification() {
        var didOpenURLs = [URL]()

        let store = TestStore(
            initialState: State(notifications: [
                .fixture(
                    id: "1",
                    url: "https://api.github.com/repos/octokit/octokit.rb/issues/123"
                )
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
                XCTAssertEqual(didOpenURLs, [
                    URL(string: "https://github.com/octokit/octokit.rb/issues/123")!
                ])
            }
        )
    }

    func testOpenPullRequestNotification() {
        var didOpenURLs = [URL]()

        let store = TestStore(
            initialState: State(notifications: [
                .fixture(
                    id: "2",
                    url: "https://api.github.com/repos/octokit/octokit.rb/pulls/321"
                )
            ]),
            reducer: reducer,
            environment: Environemnt(
                urlOpener: { didOpenURLs.append($0) },
                appTerminator: { _ in fatalError() }
            )
        )

        store.assert(
            .send(.openNotification(id: "2")),
            .do {
                XCTAssertEqual(didOpenURLs, [
                    URL(string: "https://github.com/octokit/octokit.rb/pull/321")!
                ])
            }
        )
    }

    func testOpenRepoNotification() {
        var didOpenURLs = [URL]()

        let store = TestStore(
            initialState: State(notifications: [
                .fixture(
                    id: "3",
                    url: "https://api.github.com/repos/octokit/octokit.rb"
                )
            ]),
            reducer: reducer,
            environment: Environemnt(
                urlOpener: { didOpenURLs.append($0) },
                appTerminator: { _ in fatalError() }
            )
        )

        store.assert(
            .send(.openNotification(id: "3")),
            .do {
                XCTAssertEqual(didOpenURLs, [
                    URL(string: "https://github.com/octokit/octokit.rb")!
                ])
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
