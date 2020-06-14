import Quick
import Nimble
@testable import App
import Cocoa
import ComposableArchitecture

class AppSpec: QuickSpec {
    override func spec() {
        describe("view") {
            var sut: View!
            var initialState: State!
            var store: App.Store!
            var didTerminateApp: Bool!

            beforeEach {
                initialState = .init()
                store = .init(
                    initialState: initialState,
                    reducer: reducer,
                    environment: .init(
                        appTerminator: { _ in didTerminateApp = true }
                    )
                )
                sut = .init(store: store)
            }

            afterEach {
                sut = nil
                initialState = nil
                store = nil
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
