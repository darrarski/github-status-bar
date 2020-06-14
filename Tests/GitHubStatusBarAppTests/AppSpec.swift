import Quick
import Nimble
@testable import GitHubStatusBarApp
import Cocoa
import ComposableArchitecture

class AppSpec: QuickSpec {
    override func spec() {
        context("init") {
            var sut: App!
            var initialState: AppState!
            var store: Store<AppState, AppAction>!
            var didTerminateApp: Bool!

            beforeEach {
                initialState = AppState()
                store = Store(
                    initialState: initialState,
                    reducer: appReducer,
                    environment: AppEnv(
                        appTerminator: { _ in didTerminateApp = true }
                    )
                )
                sut = App(store: store)
            }

            afterEach {
                sut = nil
                initialState = nil
                store = nil
                didTerminateApp = nil
            }

            it("should have no status bar") {
                expect(sut.statusBar).to(beNil())
            }

            context("when app finished launching") {
                beforeEach {
                    sut.applicationDidFinishLaunching(Cocoa.Notification(name: .init("test")))
                }

                it("should have status bar") {
                    expect(sut.statusBar).notTo(beNil())
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
