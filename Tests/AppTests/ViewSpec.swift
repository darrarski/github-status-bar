import Quick
import Nimble
@testable import App
import Cocoa
import ComposableArchitecture

class ViewSpec: QuickSpec {
    override func spec() {
        context("init") {
            enum TestAction {
                case didReceiveAction(App.Action)
            }

            var sut: App.View!
            var initialState: App.State!
            var testStore: Store<App.State, TestAction>!
            var didReceiveActions: [App.Action]!

            beforeEach {
                initialState = .init()
                didReceiveActions = []
                testStore = .init(
                    initialState: initialState,
                    reducer: .init { state, action, _ in
                        switch action {
                        case .didReceiveAction(let action):
                            didReceiveActions.append(action)
                        }
                        return .none
                    },
                    environment: ()
                )
                sut = .init(store: testStore.scope(
                    state: { $0 },
                    action: TestAction.didReceiveAction
                ))
            }

            afterEach {
                sut = nil
                initialState = nil
                testStore = nil
                didReceiveActions = nil
            }

            it("should have no status bar") {
                expect(sut.statusBarView).to(beNil())
            }

            context("when app did finish launching") {
                beforeEach {
                    sut.applicationDidFinishLaunching(Cocoa.Notification(name: .init("test")))
                }

                it("should have status bar") {
                    expect(sut.statusBarView).notTo(beNil())
                }

                it("should recieve action") {
                    expect(didReceiveActions) == [.fetchNotifications]
                }
            }
        }
    }
}
