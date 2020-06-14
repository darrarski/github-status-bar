import Cocoa
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
    }

    private let store: Store

}
