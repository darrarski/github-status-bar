import Quick
import Nimble
import SnapshotTesting
@testable import GitHubStatusBarApp
import Cocoa
import ComposableArchitecture

class AppDelegateSpec: QuickSpec {
    override func spec() {
        context("init") {
            var sut: AppDelegate!
            var initialState: AppState!
            var store: Store<AppState, AppAction>!

            beforeEach {
                initialState = AppState(
                    status: "Test Status"
                )
                store = Store<AppState, AppAction>(
                    initialState: initialState,
                    reducer: .empty,
                    environment: AppEnv()
                )
                sut = AppDelegate(store: store)
            }

            context("when app finished launching") {
                beforeEach {
                    sut.applicationDidFinishLaunching(Cocoa.Notification(name: .init("test")))
                }

                it("should have status bar item") {
                    expect(sut.statusBarItem).notTo(beNil())
                }

                it("should status bar item have correct title") {
                    expect(sut.statusBarItem?.button?.title) == initialState.status
                }

                it("should status bar menu have correct snapshot") {
                    if let view = sut.statusBarItem?.menu?.items.first?.view {
                        view.appearance = NSAppearance(named: .aqua)
                        assertSnapshot(matching: view, as: .image, named: "menu")
                    } else {
                        fail("view not found")
                    }
                }
            }
        }
    }
}
