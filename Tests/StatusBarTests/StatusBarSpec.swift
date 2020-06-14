import Quick
import Nimble
@testable import StatusBar
import Cocoa
import ComposableArchitecture

class StatusBarSpec: QuickSpec {
    override func spec() {
        context("init") {
            var sut: StatusBar!
            var initialState: StatusBarState!
            var store: Store<StatusBarState, StatusBarAction>!
            var didTerminateApp: Bool!

            beforeEach {
                initialState = StatusBarState()
                store = Store(
                    initialState: initialState,
                    reducer: statusBarReducer,
                    environment: StatusBarEnv(
                        appTerminator: { _ in didTerminateApp = true }
                    )
                )
                sut = StatusBar(store: store)
            }

            afterEach {
                sut = nil
                initialState = nil
                store = nil
                didTerminateApp = nil
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

                it("should terminate app") {
                    expect(didTerminateApp) == true
                }
            }
        }
    }
}
