import ComposableArchitecture
import Foundation
import GitHub
import StatusBar

public struct Environment {
    public init(
        auth: Auth,
        notificationsEndpoint: @escaping Notifications.Endpoint,
        urlOpener: @escaping (URL) -> Void,
        appTerminator: @escaping (Any?) -> Void,
        mainQueue: AnySchedulerOf<DispatchQueue>
    ) {
        self.auth = auth
        self.notificationsEndpoint = notificationsEndpoint
        self.urlOpener = urlOpener
        self.appTerminator = appTerminator
        self.mainQueue = mainQueue
    }

    public var auth: Auth
    public var notificationsEndpoint: Notifications.Endpoint
    public var urlOpener: (URL) -> Void
    public var appTerminator: (Any?) -> Void
    public var mainQueue: AnySchedulerOf<DispatchQueue>
}

extension Environment {
    var statusBar: StatusBar.Environemnt {
        .init(urlOpener: urlOpener, appTerminator: appTerminator)
    }
}
