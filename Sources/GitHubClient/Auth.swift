import Foundation

public struct Auth {
    public init(username: String, accessToken: String) {
        self.username = username
        self.accessToken = accessToken
    }

    public var username: String
    public var accessToken: String
}
