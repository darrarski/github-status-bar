import StatusBar

public struct State: Equatable {
    public init() {}
}

extension State {
    var statusBar: StatusBar.State {
        get { .init() }
        set {}
    }
}
