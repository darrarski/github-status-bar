import GitHub
import StatusBar

public struct State: Equatable {
    public init(notifications: [Notification] = []) {
        self.notifications = notifications
    }

    public var notifications: [Notification]
}

extension State {
    var statusBar: StatusBar.State {
        get { .init() }
        set {}
    }
}
