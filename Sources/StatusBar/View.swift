import Cocoa
import Combine
import ComposableArchitecture

public final class View {

    public init(store: Store<State, Action>) {
        self.store = store
        self.viewStore = .init(store.scope(state: ViewState.state))
        item.menu = menu
        viewStore.$state
            .sink(receiveValue: { [unowned self] in self.update(viewState: $0) })
            .store(in: &cancellables)
    }

    let store: Store<State, Action>
    let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = NSMenu()

    private let viewStore: ViewStore<ViewState, Action>
    private var cancellables = Set<AnyCancellable>()

    private func update(viewState: ViewState) {
        item.button?.title = viewState.title
        menu.items = [
            MenuItem(title: "Quit", action: { [weak self] in
                self?.viewStore.send(.didSelectQuit)
            })
        ]
    }

}
