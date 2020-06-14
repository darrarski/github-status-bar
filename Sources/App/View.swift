import Cocoa
import ComposableArchitecture
import StatusBar

public final class View: NSObject, NSApplicationDelegate {

    public init(store: Store) {
        self.store = store
        super.init()
    }

    private(set) var statusBarView: StatusBar.View?

    public func applicationDidFinishLaunching(_ notification: Notification) {
        statusBarView = .init(store: store.scope(
            state: \.statusBar,
            action: Action.statusBar
        ))

        ViewStore(store).send(.didFinishLaunching)
    }

    private let store: Store

}
