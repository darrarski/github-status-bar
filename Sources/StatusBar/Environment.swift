public struct Environemnt {
    public init(appTerminator: @escaping (Any?) -> Void) {
        self.appTerminator = appTerminator
    }

    public var appTerminator: (Any?) -> Void
}
