import GitHub

public struct State: Equatable {
    public init(notifications: [Notification] = []) {
        self.notifications = notifications
    }

    public var notifications: [Notification]
}
