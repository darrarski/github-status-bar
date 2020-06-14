import Cocoa
import Combine
import ComposableArchitecture

public struct StatusBarState: Equatable {
    public init() {}
}

public enum StatusBarAction: Equatable {
    case terminateApp
}

public struct StatusBarEnv {
    public init(appTerminator: @escaping (Any?) -> Void) {
        self.appTerminator = appTerminator
    }

    public var appTerminator: (Any?) -> Void
}

public typealias StatusBarReducer = Reducer<StatusBarState, StatusBarAction, StatusBarEnv>

public let statusBarReducer = StatusBarReducer { state, action, env in
    switch action {
    case .terminateApp:
        env.appTerminator(nil)
        return .none
    }
}

public final class StatusBar {

    public init(store: Store<StatusBarState, StatusBarAction>) {
        self.store = store
        self.viewStore = ViewStore(store.scope(
            state: \.view,
            action: StatusBarAction.view
        ))
        item.menu = menu
        viewStore.$state
            .sink(receiveValue: { [unowned self] in self.update(viewState: $0) })
            .store(in: &cancellables)
    }

    struct ViewState: Equatable {
        var title: String
    }

    enum ViewAction: Equatable {
        case didSelectQuit
    }

    let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = NSMenu()

    private let store: Store<StatusBarState, StatusBarAction>
    private let viewStore: ViewStore<ViewState, ViewAction>
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

private extension StatusBarState {
    var view: StatusBar.ViewState {
        .init(title: "GitHub")
    }
}

private extension StatusBarAction {
    static func view(_ viewAction: StatusBar.ViewAction) -> Self {
        switch viewAction {
        case .didSelectQuit:
            return .terminateApp
        }
    }
}
