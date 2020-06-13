import Cocoa
import Combine
import ComposableArchitecture

public final class AppDelegate: NSObject, NSApplicationDelegate {

    public init(store: Store<AppState, AppAction>) {
        self.store = store
        super.init()
    }

    private(set) var statusBarItem: NSStatusItem?

    private let store: Store<AppState, AppAction>
    private var viewStore: ViewStore<ViewState, Never>?
    private var cancellables = Set<AnyCancellable>()

    // MARK: - NSApplicationDelegate

    public func applicationDidFinishLaunching(_ notification: Cocoa.Notification) {
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

        viewStore = ViewStore(store.actionless.scope(state: { appState in
            ViewState(statusBarTitle: appState.status)
        }))

        viewStore?.$state
            .sink(receiveValue: { [unowned self] viewState in
                self.statusBarItem?.button?.title = viewState.statusBarTitle
            })
            .store(in: &cancellables)
    }

}

extension AppDelegate {
    struct ViewState: Equatable {
        var statusBarTitle: String
    }
}
