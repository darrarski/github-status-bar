public struct Auth: Equatable {
    public init(username: String, accessToken: String) {
        self.username = username
        self.accessToken = accessToken
    }

    public var username: String
    public var accessToken: String
}
