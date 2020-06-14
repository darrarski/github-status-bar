import StatusBar

public struct State: Equatable {
    public init(statusBar: StatusBar.State = .init()) {
        self.statusBar = statusBar
    }

    public var statusBar: StatusBar.State
}
