import Cocoa
import ComposableArchitecture
import StatusBar

public final class View: NSObject, NSApplicationDelegate {

    public init(store: Store<State, Action>) {
        self.store = store
        super.init()
    }

    private(set) var statusBarView: StatusBar.View?

    public func applicationDidFinishLaunching(_ notification: Notification) {
        statusBarView = .init(store: store.scope(
            state: \.statusBar,
            action: Action.statusBar
        ))

        ViewStore(store).send(.fetchNotifications)
    }

    private let store: Store<State, Action>

}
