import Cocoa
import Combine
import ComposableArchitecture
import StatusBar

public struct AppState: Equatable {
    public init(statusBar: StatusBarState = StatusBarState()) {
        self.statusBar = statusBar
    }

    public var statusBar: StatusBarState
}

public enum AppAction {
    case statusBar(StatusBarAction)
}

public struct AppEnv {
    public init(appTerminator: @escaping (Any?) -> Void) {
        self.appTerminator = appTerminator
    }

    public var appTerminator: (Any?) -> Void
}

public typealias AppReducer = Reducer<AppState, AppAction, AppEnv>

public let appReducer = AppReducer.combine(
    statusBarReducer.pullback(
        state: \.statusBar,
        action: /AppAction.statusBar,
        environment: \.statusBar
    )
)

public final class App: NSObject, NSApplicationDelegate {

    public init(store: Store<AppState, AppAction>) {
        self.store = store
        super.init()
    }

    private(set) var statusBar: StatusBar?

    public func applicationDidFinishLaunching(_ notification: Notification) {
        statusBar = StatusBar(store: store.scope(
            state: \.statusBar,
            action: AppAction.statusBar
        ))
    }

    private let store: Store<AppState, AppAction>

}

extension AppEnv {
    var statusBar: StatusBarEnv {
        StatusBarEnv(appTerminator: appTerminator)
    }
}
