import XCTest
@testable import App
@testable import GitHub
import Combine
import ComposableArchitecture

final class ReducerTests: XCTestCase {

    func testFetchingNotifications() {
        let scheduler = DispatchQueue.testScheduler
        let notificationsSubject = PassthroughSubject<Notifications.Response, Error>()
        var didRequestNotifications: [Notifications.Request] = []

        let store = TestStore(
            initialState: State(),
            reducer: reducer,
            environment: Environment(
                notificationsEndpoint: { request in
                    didRequestNotifications.append(request)
                    return notificationsSubject.first().eraseToAnyPublisher()
            },
                appTerminator: { _ in fatalError() },
                mainQueue: AnyScheduler(scheduler)
            )
        )

        store.assert(
            .send(.fetchNotifications),
            .do {
                XCTAssertEqual(didRequestNotifications, [
                    Notifications.Request(
                        auth: Auth(
                            username: "user",
                            accessToken: "access-token"
                        ),
                        all: true
                    )
                ])
                notificationsSubject.send(.init(notifications: [.fixture()]))
                scheduler.advance()
            },
            .receive(.didFetchNotifications([.fixture()])) {
                $0.notifications = [.fixture()]
            }
        )
    }

    func testFetchingNotificationsFailure() {
        let scheduler = DispatchQueue.testScheduler
        let notificationsSubject = PassthroughSubject<Notifications.Response, Error>()
        let error = NSError(domain: "test", code: 0, userInfo: nil)

        let store = TestStore(
            initialState: State(),
            reducer: reducer,
            environment: Environment(
                notificationsEndpoint: { _ in notificationsSubject.first().eraseToAnyPublisher() },
                appTerminator: { _ in fatalError() },
                mainQueue: AnyScheduler(scheduler)
            )
        )

        store.assert(
            .send(.fetchNotifications),
            .do {
                notificationsSubject.send(completion: .failure(error))
                scheduler.advance()
            }
        )
    }

    func testStatusBarRefresh() {
        let scheduler = DispatchQueue.testScheduler

        let store = TestStore(
            initialState: State(),
            reducer: reducer,
            environment: Environment(
                notificationsEndpoint: { _ in Empty().eraseToAnyPublisher() },
                appTerminator: { _ in fatalError() },
                mainQueue: AnyScheduler(scheduler)
            )
        )

        store.assert(
            .send(.statusBar(.didSelectRefresh)),
            .receive(.fetchNotifications),
            .do { scheduler.advance() }
        )
    }

    func testStatusBarQuit() {
        var didTerminateApp = false

        let store = TestStore(
            initialState: State(),
            reducer: reducer,
            environment: Environment(
                notificationsEndpoint: { _ in fatalError() },
                appTerminator: { _ in didTerminateApp = true },
                mainQueue: AnyScheduler(DispatchQueue.testScheduler)
            )
        )

        store.assert(
            .send(.statusBar(.didSelectQuit)),
            .do { XCTAssert(didTerminateApp) }
        )
    }

}
