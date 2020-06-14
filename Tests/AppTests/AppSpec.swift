import Quick
import Nimble
@testable import App
@testable import GitHub
import Cocoa
import Combine
import ComposableArchitecture

class AppSpec: QuickSpec {
    override func spec() {
        describe("view") {
            var sut: View!
            var initialState: State!
            var store: App.Store!
            var notificationsSubject: PassthroughSubject<Notifications.Response, Error>!
            var didFetchNotifications: [Notifications.Request]!
            var didTerminateApp: Bool!

            beforeEach {
                initialState = .init()
                notificationsSubject = PassthroughSubject()
                didFetchNotifications = []
                let notificationsEndpoint: Notifications.Endpoint = { request in
                    didFetchNotifications.append(request)
                    return notificationsSubject.first().eraseToAnyPublisher()
                }
                store = .init(
                    initialState: initialState,
                    reducer: reducer,
                    environment: .init(
                        notificationsEndpoint: notificationsEndpoint,
                        appTerminator: { _ in didTerminateApp = true }
                    )
                )
                sut = .init(store: store)
            }

            afterEach {
                sut = nil
                initialState = nil
                store = nil
                notificationsSubject = nil
                didFetchNotifications = nil
                didTerminateApp = nil
            }

            it("should have no status bar") {
                expect(sut.statusBarView).to(beNil())
            }

            context("when app finished launching") {
                beforeEach {
                    sut.applicationDidFinishLaunching(Cocoa.Notification(name: .init("test")))
                }

                it("should have status bar") {
                    expect(sut.statusBarView).notTo(beNil())
                }

                it("should fetch notifications") {
                    expect(didFetchNotifications).to(haveCount(1))
                    expect(didFetchNotifications.first?.auth.username) == "user"
                    expect(didFetchNotifications.first?.auth.accessToken) == "access-token"
                    expect(didFetchNotifications.first?.all) == true
                }

                context("when notifications are fetched") {
                    var notifications: [GitHub.Notification]!

                    beforeEach {
                        notifications = []
                        notificationsSubject.send(.init(notifications: notifications))
                    }

                    it("should have correct notifications") {
                        expect(ViewStore(store).state.notifications) == notifications
                    }
                }

                context("when notifications fetching fails") {
                    beforeEach {
                        let error = NSError(domain: "test", code: 0, userInfo: nil)
                        notificationsSubject.send(completion: .failure(error))
                    }

                    it("should not update notifications") {
                        expect(ViewStore(store).state.notifications) == initialState.notifications
                    }
                }

                context("when status bar terminate app action is send") {
                    beforeEach {
                        ViewStore(store).send(.statusBar(.terminateApp))
                    }

                    it("should terminate app") {
                        expect(didTerminateApp) == true
                    }
                }
            }
        }
    }
}
