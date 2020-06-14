import SwiftEndpoint

public struct Notifications {
    public struct Request: Equatable {
        public init(
            auth: Auth,
            all: Bool = false
        ) {
            self.auth = auth
            self.all = all
        }

        public var auth: Auth
        public var all: Bool
    }

    public struct Response: Equatable {
        public var notifications: [Notification]
    }

    public typealias Endpoint = SwiftEndpoint.Endpoint<Request, Response>
}
