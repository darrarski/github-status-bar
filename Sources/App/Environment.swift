import ComposableArchitecture
import Foundation
import GitHub
import StatusBar

public struct Environment {
    public init(
        notificationsEndpoint: @escaping Notifications.Endpoint,
        appTerminator: @escaping (Any?) -> Void,
        mainQueue: AnySchedulerOf<DispatchQueue>
    ) {
        self.notificationsEndpoint = notificationsEndpoint
        self.appTerminator = appTerminator
        self.mainQueue = mainQueue
    }

    public var notificationsEndpoint: Notifications.Endpoint
    public var appTerminator: (Any?) -> Void
    public var mainQueue: AnySchedulerOf<DispatchQueue>
}

extension Environment {
    var statusBar: StatusBar.Environemnt {
        .init(appTerminator: appTerminator)
    }
}
