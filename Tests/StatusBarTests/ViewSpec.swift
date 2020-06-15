import Quick
import Nimble
import Difference
@testable import StatusBar
@testable import GitHub
import Cocoa
import ComposableArchitecture

class ViewSpec: QuickSpec {
    override func spec() {
        context("init") {
            enum TestAction {
                case update(State)
                case didReceiveAction(Action)
            }

            var sut: View!
            var initialState: State!
            var testStore: Store<State, TestAction>!
            var didReceiveActions: [Action]!

            beforeEach {
                initialState = State()
                didReceiveActions = []
                testStore = .init(
                    initialState: initialState,
                    reducer: .init { state, action, _ in
                        switch action {
                        case .update(let newState):
                            state = newState
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
                    expect(didReceiveActions) == [.didSelectQuit]
                }
            }

            context("when notifications are updated") {
                var newState: State!

                beforeEach {
                    newState = ViewStore(testStore).state
                    newState.notifications = [
                        .fixture(id: "1", title: "Notification 1", unread: true),
                        .fixture(id: "2", title: "Notification 2", unread: true),
                        .fixture(id: "3", title: "Notification 3", unread: false),
                        .fixture(id: "4", title: "Notification 4", unread: false),
                        .fixture(id: "5", title: "Notification 5", unread: false)
                    ]
                    ViewStore(testStore).send(.update(newState))
                }

                it("should item have correct title") {
                    expect(sut.item.button?.title) == "GitHub (2)"
                }

                it("should menu have correct items") {
                    expect(sut.menu.items.map(MenuItem.from(menuItem:))) == [
                        .init(title: "Notification 1"),
                        .init(title: "Notification 2"),
                        .init(title: "Read", subitems: [
                            .init(title: "Notification 3"),
                            .init(title: "Notification 4"),
                            .init(title: "Notification 5")
                        ]),
                        .init(title: ""),
                        .init(title: "Quit")
                    ]
                }
            }
        }

        it("MenuItem should not support NSCoding") {
            expect { _ = StatusBar.MenuItem(coder: NSCoder()) }.to(throwAssertion())
        }
    }
}

private struct MenuItem: Equatable {
    var title: String
    var subitems: [MenuItem]? = nil

    static func from(menuItem: NSMenuItem) -> MenuItem {
        .init(
            title: menuItem.title,
            subitems: menuItem.submenu?.items.map(MenuItem.from(menuItem:))
        )
    }
}
