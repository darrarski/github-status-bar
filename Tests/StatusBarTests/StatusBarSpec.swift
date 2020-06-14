import Quick
import Nimble
@testable import StatusBar
import Cocoa
import ComposableArchitecture

class StatusBarSpec: QuickSpec {
    override func spec() {
        describe("view") {
            var sut: View!
            var initialState: State!
            var store: StatusBar.Store!
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

            it("should item have correct menu") {
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

                it("should terminate app") {
                    expect(didTerminateApp) == true
                }
            }
        }

        it("MenuItem should not support NSCoding") {
            expect { _ = MenuItem(coder: NSCoder()) }.to(throwAssertion())
        }
    }
}
