import GitHub
import StatusBar

public struct Environment {
    public init(
        notificationsEndpoint: @escaping Notifications.Endpoint,
        appTerminator: @escaping (Any?) -> Void
    ) {
        self.notificationsEndpoint = notificationsEndpoint
        self.appTerminator = appTerminator
    }

    public var notificationsEndpoint: Notifications.Endpoint
    public var appTerminator: (Any?) -> Void
}

extension Environment {
    var statusBar: StatusBar.Environemnt {
        .init(appTerminator: appTerminator)
    }
}
