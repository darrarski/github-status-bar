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

    let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = NSMenu()

    private let store: Store<State, Action>
    private let viewStore: ViewStore<ViewState, Action>
    private var cancellables = Set<AnyCancellable>()

    private func update(viewState: ViewState) {
        item.button?.title = "GitHub"
        menu.items = []
        if viewState.notifications.isEmpty == false {
            let unreadNotifications = viewState.notifications.filter(\.unread)
            if unreadNotifications.isEmpty == false {
                item.button?.title.append(" (\(unreadNotifications.count))")
                menu.items.append(contentsOf: unreadNotifications.map(menuItem(for:)))
            }
            let readNotifications = viewState.notifications.filter(\.read)
            if readNotifications.isEmpty == false {
                menu.items.append(MenuItem(
                    title: "Read",
                    subitems: readNotifications.map(menuItem(for:))
                ))
            }
            menu.items.append(.separator())
        }
        menu.items.append(MenuItem(title: "Refresh", action: { [weak self] in
            self?.viewStore.send(.refresh)
        }))
        menu.items.append(MenuItem(title: "Quit", action: { [weak self] in
            self?.viewStore.send(.quit)
        }))
    }

    private func menuItem(for notification: ViewState.Notification) -> NSMenuItem {
        MenuItem(title: notification.title)
    }

}
