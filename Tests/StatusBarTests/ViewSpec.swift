import Quick
import Nimble
@testable import StatusBar
import Cocoa
import ComposableArchitecture

class ViewSpec: QuickSpec {
    override func spec() {
        context("init") {
            enum TestAction {
                case didReceiveAction(Action)
            }

            var sut: View!
            var initialState: State!
            var testStore: ComposableArchitecture.Store<State, TestAction>!
            var didReceiveActions: [Action]!

            beforeEach {
                initialState = State()
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

            it("should have correct menu") {
                expect(sut.item.menu) === sut.menu
            }

            it("should item have correct title") {
                expect(sut.item.button?.title) == "GitHub"
            }

            it("should menu have correct items") {
                expect(sut.menu.items).to(haveCount(1))
                let itemTitles = sut.menu.items.map(\.title)
                expect(itemTitles) == ["Quit"]
            }

            context("when quit is selected") {
                beforeEach {
                    sut.menu.performActionForItem(at: 0)
                }

                it("should send action") {
                    expect(didReceiveActions) == [.terminateApp]
                }
            }
        }

        it("MenuItem should not support NSCoding") {
            expect { _ = MenuItem(coder: NSCoder()) }.to(throwAssertion())
        }
    }
}
